from src.base_dao import BaseDAO
from src.app.authentication.models import RefreshSessionModel
from src.app.authentication.schemas import RefreshSessionCreate, RefreshSessionUpdate


class RefreshSessionDAO(BaseDAO[RefreshSessionModel, RefreshSessionCreate, RefreshSessionUpdate]):
    model = RefreshSessionModel

