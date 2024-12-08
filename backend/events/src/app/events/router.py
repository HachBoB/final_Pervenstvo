import uuid
from pathlib import Path

from fastapi import APIRouter, Depends, UploadFile, HTTPException
from fastapi.params import File
from fastapi_cache.decorator import cache
from sqlalchemy.ext.asyncio import AsyncSession

from src.app.events.dao import EventDAO
from src.app.events.models import EventModel
from src.app.events.schemas import FilterParams, CreateEvent
from src.app.events.service import EventService
from src.database import db
from src.dependencies import get_current_admin, get_current_super_admin
from fastapi.responses import JSONResponse

router = APIRouter()


@cache(expire=30)
@router.get('')
async def get_list(
        offset: int = 0,
        limit: int = 10,
        filter_by: FilterParams = Depends(),
        session: AsyncSession = Depends(db.get_async_session)
):
    return await EventService.get_list(session, filter_by, offset, limit)


@router.post('')
async def create_event(
        data: CreateEvent,
        current_admin: dict = Depends(get_current_admin),
        session: AsyncSession = Depends(db.get_async_session)
):
    return await EventService.create_event(session, data, current_admin)


@router.post('/Confirm/{id}')
async def confirm_event(
        id: uuid.UUID,
        current_super_admin: dict = Depends(get_current_super_admin),
        session: AsyncSession = Depends(db.get_async_session)
):
    return await EventService.edit_status(session, id, "Опубликовано", current_super_admin)


@router.post('/Cancel/{id}')
async def cancel_event(
        id: uuid.UUID,
        current_super_admin: dict = Depends(get_current_super_admin),
        session: AsyncSession = Depends(db.get_async_session)
):
    return await EventService.edit_status(session, id, "Отклонено", current_super_admin)


@cache(expire=30)
@router.get('/Consideration')
async def get(
        session: AsyncSession = Depends(db.get_async_session),
        current_super_admin: dict = Depends(get_current_super_admin)
):
    return await EventService.get_consideration_events(session, current_super_admin)


@router.post("/{id}/Report")
async def upload_report(
    id: uuid.UUID,
    file: UploadFile = File(...)
):
    try:
        print(123)
        async with db.session() as session:  # убедитесь, что `db.session()` асинхронно
            event = await EventDAO.find_one_or_none(session, EventModel.id == id)
            if not event:
                return JSONResponse(content={"error": "Event not found"}, status_code=404)

            reports_dir = Path(__file__).parent.parent.parent.parent / "reports"

            file_name = f"{id}.{file.filename.split('.')[-1]}"
            file_path = reports_dir / file_name

            # Сохраняем файл
            with file_path.open("wb") as buffer:
                buffer.write(await file.read())

            # Формируем путь к отчету
            file_url = f"/api/EventsService/Reports/{file_name}"
            event.report_path = file_url
            await session.commit()

        return {"message": "Report uploaded successfully", "file_url": file_url}

    except Exception as e:
        raise HTTPException(status_code=500, detail=f"File upload failed: {str(e)}")


