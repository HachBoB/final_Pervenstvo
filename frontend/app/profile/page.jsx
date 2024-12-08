import { cookies } from "next/headers";
import { getUserData } from "@/app/api/userAct";
import ProfileClientComponent from "./ProfileClientComponent";

export default async function PersonalPage() {
    // Получаем токен из cookies
    const cookieStore = await cookies(); // Убедитесь, что cookies() дожидается
    const token = cookieStore.get("access_token")?.value;

    if (!token) {
        return (
            <div className="text-center text-white">
                Пожалуйста, выполните вход, чтобы получить доступ к профилю.
            </div>
        );
    }

    let userData;
    try {
        userData = await getUserData(token);
        console.log(userData)
    } catch (error) {
        return (
            <div className="text-center text-white">
                Ошибка при загрузке данных. Повторите попытку позже.
            </div>
        );
    }
    let new_events
    if(userData.role.name === "Super admin"){
        console.log(token)
        const res = await fetch("https://mihest.ru/api/EventsService/Events/Consideration", {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${token}`,
            }
        })
        new_events = await res.json();
        console.log(new_events)
    }

    // Передаём данные пользователя и токен в клиентский компонент
    return <ProfileClientComponent userData={userData} new_events={new_events} token={token} />;
}