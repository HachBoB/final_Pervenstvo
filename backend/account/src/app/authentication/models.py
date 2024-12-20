import uuid
from datetime import datetime

from sqlalchemy import UUID, ForeignKey, TIMESTAMP, func, String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from src.base_model import Base
from src.app.accounts.models import UserModel


class RefreshSessionModel(Base):
    __tablename__ = 'refresh_session'

    refresh_token: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, index=True)
    access_token: Mapped[str] = mapped_column()
    expires_in: Mapped[int]
    user_id: Mapped[uuid.UUID] = mapped_column(UUID, ForeignKey(
        "users.id", ondelete="CASCADE"))
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), server_default=func.now())

    user: Mapped[UserModel] = relationship("UserModel", back_populates="refresh_sessions")


class ResetSessionModel(Base):
    __tablename__ = 'reset_session'

    id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, index=True, default=uuid.uuid4)
    user_id: Mapped[uuid.UUID] = mapped_column(UUID, ForeignKey(
        "users.id", ondelete="CASCADE"))
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), default=func.now())

    user: Mapped[UserModel] = relationship("UserModel", back_populates="reset_sessions")


class ConfirmSessionModel(Base):
    __tablename__ = 'confirm_session'

    id: Mapped[uuid.UUID] = mapped_column(UUID, primary_key=True, index=True, default=uuid.uuid4)
    user_id: Mapped[uuid.UUID] = mapped_column(UUID, ForeignKey(
        "users.id", ondelete="CASCADE"))
    created_at: Mapped[datetime] = mapped_column(TIMESTAMP(timezone=True), default=func.now())

    user: Mapped[UserModel] = relationship("UserModel", back_populates="confirm_sessions")

