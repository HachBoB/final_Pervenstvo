from src.app.events.models import EventModel, StatusModel
from src.base_dao import BaseDAO


class EventDAO(BaseDAO[EventModel, None, None]):
    model = EventModel


class StatusDAO(BaseDAO[StatusModel, None, None]):
    model = StatusModel


