import os
import sys
from contextlib import asynccontextmanager
# from fastapi_cache import FastAPICache
# from fastapi_cache.backends.redis import RedisBackend
# from redis import asyncio as aioredis
import asyncio
from fastapi import FastAPI
import uvicorn
from fastapi.middleware.cors import CORSMiddleware

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from src.app.notification.service import NotificationService
from src.rabbitMq.server import consume_rabbitmq
# from src.rabbitMq.server import consume_rabbitmq
from src.app import all_routers


@asynccontextmanager
async def lifespan(_: FastAPI):
    # redis = aioredis.from_url(
    #     f"redis://{settings.REDIS_HOST}",
    #     encoding='utf-8',
    #     decode_responses=True
    # )
    # FastAPICache.init(RedisBackend(redis), prefix='account')
    task = asyncio.create_task(consume_rabbitmq())
    await NotificationService.start_scheduler()
    try:
        yield
    finally:
        await NotificationService.stop_scheduler()
        task.cancel()
        # await redis.close()


app = FastAPI(
    title="Notification microservice",
    docs_url='/ui-swagger',
    lifespan=lifespan,
    root_path="/api/NotificationService"
)


app.include_router(
    all_routers
)

app.add_middleware(
    CORSMiddleware,
    allow_origins='*',
    allow_credentials=True,
    allow_methods='*',
    allow_headers='*',
)

if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', port=8083, log_level='info', reload=True)
