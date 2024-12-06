import uuid

from fastapi_mail import MessageSchema, MessageType

from src.config import fm


class NotificationService:
    @classmethod
    async def send_forgot(cls, email: str, uuid: uuid.UUID):
        message = MessageSchema(
            subject="Сброс пароля",
            recipients=[email],
            template_body={
                "url": f"http://localhost:3000/forgot/{uuid}"
            },
            subtype=MessageType.html
        )
        await fm.send_message(message, template_name="forgot.html")

    @classmethod
    async def send_confirm(cls, email: str, uuid: uuid.UUID):
        message = MessageSchema(
            subject="Подтверждение почты",
            recipients=[email],
            template_body={
                "url": f"http://localhost:3000/confirm/{uuid}"
            },
            subtype=MessageType.html
        )
        await fm.send_message(message, template_name="confirm.html")

