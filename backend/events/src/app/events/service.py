import uuid

from fastapi import HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

from src.app.events.dao import EventDAO, StatusDAO
from src.app.events.models import EventModel, StatusModel
from src.app.events.schemas import FilterParams, CreateEvent
from src.dependencies import validate_district


class EventService:
    @classmethod
    async def get_list(cls, session: AsyncSession, filter_params: FilterParams, offset: int, limit: int):
        filters = []
        if filter_params.id is not None:
            filters.append(EventModel.id == filter_params.id)

        if filter_params.name is not None:
            filters.append(EventModel.name.ilike(f'%{filter_params.name}%'))

        if filter_params.location is not None:
            filters.append(EventModel.location.ilike(f'%{filter_params.location}%'))

        if filter_params.start_date_gte is not None:
            filters.append(EventModel.start_date >= filter_params.start_date_gte)

        if filter_params.start_date_lte is not None:
            filters.append(EventModel.start_date < filter_params.start_date_lte)

        if filter_params.end_date_gte is not None:
            filters.append(EventModel.end_date >= filter_params.end_date_gte)

        if filter_params.end_date_lte is not None:
            filters.append(EventModel.end_date < filter_params.end_date_lte)

        if filter_params.discipline is not None:
            filters.append(EventModel.discipline.ilike(f'%{filter_params.discipline}%'))

        if filter_params.format is not None:
            filters.append(EventModel.format.ilike(f'%{filter_params.format}%'))

        if filter_params.district_id is not None:
            filters.append(EventModel.district_id == filter_params.district_id)

        if filter_params.region is not None:
            filters.append(EventModel.region.ilike(f'%{filter_params.region}%'))

        return await EventDAO.find_all(session, *filters, offset=offset, limit=limit)

    @classmethod
    async def create_event(cls, session: AsyncSession, data: CreateEvent, user: dict):
        await validate_district(data.district_id)
        if str(data.district_id) != user["district_id"]:
            raise HTTPException(status_code=403, detail="You can't confirm this event")

        status = await StatusDAO.find_one_or_none(session, StatusModel.name == "В рассмотрение")
        return await EventDAO.add(session, {
            **data.model_dump(),
            "status_id": status.id,
            "owner_id": user["sub"]
        })

    @classmethod
    async def edit_status(cls, session: AsyncSession, event_id: uuid.UUID, status: str, user: dict):
        event = await EventDAO.find_one_or_none(session, EventModel.id == event_id)
        if not event:
            raise HTTPException(status_code=404, detail="Event not found")
        if str(event.district_id) != user["district_id"]:
            raise HTTPException(status_code=403, detail="You can't confirm this event")

        status = await StatusDAO.find_one_or_none(session, StatusModel.name == status)
        event.status_id = status.id
        return event

    @classmethod
    async def get_consideration_events(cls, session: AsyncSession, user: dict):
        return await EventDAO.find_all(session, EventModel.district_id == user["district_id"], EventModel.status_id == "e1aad360-47ed-4205-9e03-19f53f893017")

