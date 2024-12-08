import uuid
from datetime import date
from typing import List

from sqlalchemy import UUID, String, Date, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from src.base_model import Base


class EventModel(Base):
    __tablename__ = 'events'

    id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, default=uuid.uuid4)
    name: Mapped[str] = mapped_column(String, nullable=False)
    location: Mapped[str] = mapped_column(String, nullable=True)
    start_date: Mapped[date] = mapped_column(Date)
    end_date: Mapped[date] = mapped_column(Date, nullable=True)
    discipline: Mapped[str] = mapped_column(String, nullable=True)
    quantity: Mapped[str] = mapped_column(String, nullable=True)
    format: Mapped[str] = mapped_column(String, nullable=True)
    region: Mapped[str] = mapped_column(String, nullable=True)
    district_id: Mapped[uuid.UUID] = mapped_column(UUID, nullable=True)
    report_path: Mapped[str] = mapped_column(String, nullable=True)
    status_id: Mapped[uuid.UUID] = mapped_column(UUID, ForeignKey(
        "statuses.id", ondelete="CASCADE"), nullable=True)
    owner_id: Mapped[uuid.UUID] = mapped_column(UUID, nullable=True)

    status: Mapped["StatusModel"] = relationship(
        "StatusModel",
        back_populates="events"
    )


class StatusModel(Base):
    __tablename__ = 'statuses'
    id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, default=uuid.uuid4)
    name: Mapped[str] = mapped_column(String(30), unique=True, nullable=False)

    events: Mapped[List["EventModel"]] = relationship(
        "EventModel",
        back_populates="status",
        cascade="all, delete",
        passive_deletes=True
    )

