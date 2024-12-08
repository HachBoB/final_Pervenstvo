import uuid

from src.config import settings
from . import RabbitMQBaseClientRPC


class RabbitMQClientRPC(RabbitMQBaseClientRPC):
    def __init__(self, rabbitmq_url=f'amqp://{settings.RABBITMQ_USER}:{settings.RABBITMQ_PASSWORD}@{settings.RABBITMQ_HOST}/'):
        super().__init__(rabbitmq_url)

    async def call(self, district_id: uuid.UUID):
        await self.connect()
        async with self.connection:
            channel, callback_queue = await self.create_channel_and_queue()
            correlation_id = str(uuid.uuid4())

            body = str(district_id).encode()

            await self._publish_message(
                channel=channel,
                body=body,
                routing_key='check_district',
                correlation_id=correlation_id,
                reply_to=callback_queue.name,
            )
            response = await self._wait_for_response(callback_queue, correlation_id)
        await self.close()
        return response == b'\01'