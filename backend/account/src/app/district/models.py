import uuid
from typing import List

from sqlalchemy import UUID, String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from src.base_model import Base


class DistrictModel(Base):
    __tablename__ = 'districts'
    id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, default=uuid.uuid4)
    name: Mapped[str] = mapped_column(String(100), nullable=False)

    users: Mapped[List["UserModel"]] = relationship(
        "UserModel",
        back_populates="district",
        cascade="all, delete",
        passive_deletes=True
    )
