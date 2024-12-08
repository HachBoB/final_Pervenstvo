"use client"
import { redirect } from "next/navigation";
import {useState} from "react"; // Для перенаправления после удаления

export default function Forgot({ id }) {
    console.log(id); // Для отладки
    const [confirm_password, setConfirmPassword] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");
    const handleSubmit = async (e) => {
        e.preventDefault();
        setError("");
        try {
            const response = await fetch(`https://mihest.ru/api/AccService/Authentication/ForgotPassword/${id}`,
                {
                    body:JSON.stringify({
                        password,
                        confirm_password,
                    }),
                    method: "POST",
                });

            if (!response.ok) {
                throw new Error(`Ошибка при удалении: ${response.status}`);
            }

            console.log("Уведомление успешно удалено");
        } catch (error) {
            console.error("Ошибка", error);
            throw error; // Можно обработать или просто выбросить исключение

        }
        location.replace("/")
    }
    return (
        <>
            <div
                className="fixed top-0 left-0 right-0 bottom-0 bg-zinc-950 bg-opacity-80 flex justify-center items-center z-20"
                onClick={(e) => e.target === e.currentTarget && closeModal()}
            >
                <div className="w-1/4 border-[#DB7038] border-2 rounded-[30px] p-5 flex shadow-custom bg-[#DD7135] bg-opacity-[65%] flex-col">
                    <p className="mb-8 text-center text-[40px]">Восстановление пароля</p>
                    {error && <p className="text-red-500 text-center">{error}</p>}
                    <form onSubmit={handleSubmit} className="flex flex-col gap-6">
                        <input
                            type="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none"
                            placeholder="Пароль"
                            required
                        />
                        <input
                            type="password"
                            value={confirm_password}
                            onChange={(e) => setConfirmPassword(e.target.value)}
                            className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none"
                            placeholder="Подтверждение пароля"
                            required
                        />
                        <button
                            type="submit"
                            className="bg-[#DB7038] text-white py-2 rounded-[10px] text-[20px]"
                        >
                            Восстановить
                        </button>
                    </form>
                </div>
            </div>
        </>
    )

}