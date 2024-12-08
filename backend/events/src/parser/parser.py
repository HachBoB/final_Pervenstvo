import os
import sys
from datetime import datetime

import httpx
from bs4 import BeautifulSoup

sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

from src.app.events.dao import EventDAO
from src.database import db


async def fetch_data():
    async with httpx.AsyncClient() as client:
        res = await client.get("https://fsp-russia.com/calendar/archive/")
        soup = BeautifulSoup(res.text, "html.parser")

        items = soup.find_all("div", class_="archive_item")
        async with db.session() as session:
            for item in items:
                await asyncio.sleep(1)
                # Проверка наличия блока "city"
                city_cont = item.find("div", class_="city")
                city = city_cont.find("p").text if city_cont and city_cont.find("p") else None

                # Проверка наличия блока "mens"
                mens_cont = item.find("div", class_="mens")
                mens = mens_cont.find("p").text if mens_cont and mens_cont.find("p") else None

                # Проверка наличия блока "discipline"
                discipline_cont = item.find("div", class_="discipline")
                discipline = discipline_cont.find("p").text if discipline_cont and discipline_cont.find("p") else None

                # Проверка наличия блока "title"
                title_cont = item.find("div", class_="title")
                title = title_cont.find("p").text if title_cont and title_cont.find("p") else None

                # Проверка наличия ссылки
                link = item.find("a")
                url = link.attrs["href"] if link and "href" in link.attrs else None

                if not url:
                    continue  # Если ссылки нет, пропускаем итерацию

                # Загружаем страницу по ссылке
                response = await client.get("https://fsp-russia.com/" + url)
                s = BeautifulSoup(response.text, "html.parser")

                # Проверка наличия блока "hybrid"
                format_cont = s.find("div", class_="hybrid")
                format = format_cont.find("p").text if format_cont and format_cont.find("p") else None

                # Проверка наличия блока "date"
                date_cont = s.find("div", class_="date")
                dates = (
                    date_cont.find("p").text.split("-") if date_cont and date_cont.find("p") else None
                )
                await EventDAO.add(session, {
                    "location": city,
                    "quantity": mens,
                    "start_date": datetime.strptime(dates[0], "%d.%m.%Y").date(),
                    "end_date": datetime.strptime(dates[1], "%d.%m.%Y").date() if len(dates) > 1 else None,
                    "discipline": discipline,
                    "format": format,
                    "name": title
                })
            await session.commit()

# Для запуска кода в асинхронной среде
import asyncio
asyncio.run(fetch_data())
