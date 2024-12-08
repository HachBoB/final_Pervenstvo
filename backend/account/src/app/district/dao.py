from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from src.app.accounts.models import UserModel, RoleModel
from src.app.district.models import DistrictModel
from src.base_dao import BaseDAO


class DistrictDAO(BaseDAO[DistrictModel, None, None]):
    model = DistrictModel

