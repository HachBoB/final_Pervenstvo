// app/event/[id]/page.jsx

import EventDetail from './ClientComponent'; // Импортируем EventDetail

export default async function EventPage({ params }) {
    const { id } = await params;  // Используем params для получения id события из маршрута

    const response = await fetch(`https://mihest.ru/api/EventsService/Events?id=${id}`);
    const data = await response.json();

    return (
        <div>
            <EventDetail event={data} />
        </div>
    );
}
