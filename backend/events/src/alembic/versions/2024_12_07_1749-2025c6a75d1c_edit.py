"""edit

Revision ID: 2025c6a75d1c
Revises: 875c28a8e8cf
Create Date: 2024-12-07 17:49:42.901090

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '2025c6a75d1c'
down_revision: Union[str, None] = '875c28a8e8cf'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('events', 'status_id',
               existing_type=sa.UUID(),
               nullable=True)
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('events', 'status_id',
               existing_type=sa.UUID(),
               nullable=False)
    # ### end Alembic commands ###