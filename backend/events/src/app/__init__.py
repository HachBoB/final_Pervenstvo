from fastapi import APIRouter
from src.app.events.router import router as router_events


all_routers = APIRouter()

all_routers.include_router(
    router_events,
    prefix='/Events',
    tags=['Events']
)

