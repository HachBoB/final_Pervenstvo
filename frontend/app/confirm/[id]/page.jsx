import { redirect } from "next/navigation"; // Для перенаправления после удаления

export default async function DeleteNotificationPage({ params }) {
    const id = (await params).id; // Распаковываем id из params
    console.log(id); // Для отладки

    try {
        const response = await fetch(`https://mihest.ru/api/AccService/Authentication/Verify/${id}`, {
            method: "POST",
        });

        if (!response.ok) {
            throw new Error(`Ошибка при удалении: ${response.status}`);
        }

        console.log("Уведомление успешно удалено");
    } catch (error) {
        console.error("Ошибка удаления уведомления:", error);
        throw error; // Можно обработать или просто выбросить исключение
    }

    redirect("/"); // Перенаправляем на главную страницу
}
