import uuid
from datetime import date
from typing import Optional

from pydantic import BaseModel


class FilterParams(BaseModel):
    id: Optional[uuid.UUID] = None
    name: Optional[str] = None
    location: Optional[str] = None
    start_date_gte: Optional[date] = None
    start_date_lte: Optional[date] = None
    end_date_gte: Optional[date] = None
    end_date_lte: Optional[date] = None
    format: Optional[str] = None
    discipline: Optional[str] = None
    district_id: Optional[uuid.UUID] = None
    quantity: Optional[str] = None
    region: Optional[str] = None


class CreateEvent(BaseModel):
    name: str
    location: Optional[str]
    region: Optional[str]
    start_date: date
    end_date: Optional[date]
    format: str
    discipline: str
    quantity: Optional[str]
    district_id: uuid.UUID
