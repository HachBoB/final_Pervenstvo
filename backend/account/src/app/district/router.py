from fastapi import APIRouter, Depends
from fastapi_cache.decorator import cache
from sqlalchemy.orm import selectinload
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from src.app.accounts.models import UserModel, RoleModel
from src.app.district.models import DistrictModel
from src.app.district.schemas import DistrictSchema, UserSchema
from src.database import db

router = APIRouter()


@cache(expire=360)
@router.get('', response_model=list[DistrictSchema])
async def get_district(
        session: AsyncSession = Depends(db.get_async_session)
):
    res = await session.execute(select(DistrictModel).options(selectinload(DistrictModel.users)))
    districts = res.scalars().all()
    data = []
    for i in districts:
        data.append(
            DistrictSchema(
                id=i.id,
                name=i.name,
                users=[
                    UserSchema(
                        id=user.id,  # Поля UserSchema
                        email=user.email,  # Укажите нужные поля
                        role="Admin",
                        region=user.region,
                        first_name=user.first_name,
                        last_name=user.last_name,
                        patronymic=user.patronymic

                    )
                    for user in i.users if user.role_id == 2
                ]
            )
        )
    # Получаем всех пользователей округа с ролью Admin
    return data

