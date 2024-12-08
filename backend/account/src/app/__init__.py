from fastapi import APIRouter

from .authentication.router import router as router_auth
from .accounts.router import router as router_accounts
from .district.router import router as router_district

all_router = APIRouter()

all_router.include_router(
    router_auth,
    prefix='/Authentication',
    tags=['Authentication']
)

all_router.include_router(
    router_accounts,
    prefix='/Accounts',
    tags=['Accounts']
)


all_router.include_router(
    router_district,
    prefix='/District',
    tags=['District']
)


