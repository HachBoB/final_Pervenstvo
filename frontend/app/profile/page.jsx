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

    // Загружаем данные пользователя
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

    // Передаём данные пользователя и токен в клиентский компонент
    return <ProfileClientComponent userData={userData} token={token} />;
}