from pydantic import BaseModel, Field, ConfigDict
from typing import List, Optional
import uuid


class UserSchema(BaseModel):
    id: uuid.UUID
    email: str
    first_name: str
    last_name: Optional[str]
    patronymic: Optional[str]
    region: Optional[str]

    model_config = ConfigDict(from_attributes=True)


class DistrictSchema(BaseModel):
    id: uuid.UUID
    name: str
    users: List[UserSchema] = Field(default_factory=list)

    model_config = ConfigDict(from_attributes=True)
