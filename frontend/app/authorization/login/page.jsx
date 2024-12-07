import { useState } from "react";
import axios from "axios";
import {redirect} from "next/navigation";

export default function Login({ closeModal, openRegister }) {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError("");

        try {
            const response = await axios.post(`${process.env.NEXT_PUBLIC_BACKEND_HOST}/api/AccService/Authentication/SignIn`, {
                email,
                password,
            });
            console.log(response.data)

            // Установка токенов в cookies
            document.cookie = `access_token=${response.data.access_token}; path=/; max-age=2592000`;
            document.cookie = `refresh_token=${response.data.refresh_token}; path=/; max-age=2592000`;

            // Закрытие модалки и редирект
            closeModal();
            window.location.reload();
        } catch (err) {
            setError(err.response?.data?.message || "Ошибка при входе");
        }
    };

    return (
        <div
            className="fixed top-0 left-0 right-0 bottom-0 bg-zinc-950 bg-opacity-80 flex justify-center items-center z-20"
            onClick={(e) => e.target === e.currentTarget && closeModal()}
        >
            <div className="w-1/4 border-[#DB7038] border-2 rounded-[30px] flex shadow-custom bg-[#DD7135] bg-opacity-[65%] flex-col">
                <p className="mb-8 text-center text-[40px]">Вход</p>
                {error && <p className="text-red-500 text-center">{error}</p>}
                <form onSubmit={handleSubmit} className="flex flex-col gap-6">
                    <input
                        type="email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none"
                        placeholder="Почта"
                        required
                    />
                    <input
                        type="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none"
                        placeholder="Пароль"
                        required
                    />
                    <button
                        type="submit"
                        className="bg-[#DB7038] text-white py-2 rounded-[10px] text-[20px]"
                    >
                        Войти
                    </button>
                </form>
                <p className="mt-2 text-center text-[14px]">
                    Забыли пароль? <a href="#">Восстановить</a>
                </p>
                <p
                    className="mt-2 text-center text-[14px]"
                    onClick={openRegister}
                >
                    Еще не зарегистрированы? <a href="#">Регистрация</a>
                </p>
            </div>
        </div>
    );
}
