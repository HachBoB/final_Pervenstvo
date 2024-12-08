import Forgot from './ClientComponent';

export default async function ForgotPass({ params }) {
    const { id } = await params;  // Используем params для получения id события из маршрута

    const response = await fetch(`https://mihest.ru/api/EventsService/Events?id=${id}`);
    const data = await response.json();

    return (
        <div>
            <Forgot id={id} />
        </div>
    );
}
