"""edit

Revision ID: 27a31c0ad9d7
Revises: 2025c6a75d1c
Create Date: 2024-12-07 18:36:17.396858

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '27a31c0ad9d7'
down_revision: Union[str, None] = '2025c6a75d1c'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('events', sa.Column('region', sa.String(), nullable=True))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('events', 'region')
    # ### end Alembic commands ###
