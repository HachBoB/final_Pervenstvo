export async function fetchEventData(id) {
    const response = await fetch(`${process.env.NEXT_PUBLIC_BACKEND_HOST}/api/EventsService/Events?id=${id}`);
    if (!response.ok) {
        throw new Error("Ошибка при загрузке данных события");
    }
    return await response.json();
}