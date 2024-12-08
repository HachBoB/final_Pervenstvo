// app/event/[id]/page.jsx

import EventDetail from './ClientComponent';
import {cookies} from "next/headers"; // Импортируем EventDetail

export default async function EventPage({ params }) {
    const { id } = await params;  // Используем params для получения id события из маршрута

    const response = await fetch(`https://mihest.ru/api/EventsService/Events?id=${id}`);
    const data = await response.json();
    const cookieStore = await cookies(); // Убедитесь, что cookies() дожидается
    const token = cookieStore.get("access_token")?.value;
    return (
        <div>
            <EventDetail token={token} id={id} event={data} />
        </div>
    );
}
