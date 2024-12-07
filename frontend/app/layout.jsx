"use client";
import localFont from "next/font/local";
import "./globals.css";
import Image from "next/image";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";
import Login from "@/app/authorization/login/page";
import Registration from "@/app/authorization/registration/page";

const geistSans = localFont({
    src: "./fonts/GeistVF.woff",
    variable: "--font-geist-sans",
    weight: "100 900",
});
const geistMono = localFont({
    src: "./fonts/GeistMonoVF.woff",
    variable: "--font-geist-mono",
    weight: "100 900",
});

export default function RootLayout({ children }) {
    const pathname = usePathname();
    const [isFirstModalOpen, setIsFirstModalOpen] = useState(false);
    const [isSecondModalOpen, setIsSecondModalOpen] = useState(false);
    const [isAuthenticated, setIsAuthenticated] = useState(false);

    const openFirstModal = () => {
        setIsFirstModalOpen(true);
        setIsSecondModalOpen(false);
    };

    const openSecondModal = () => {
        setIsSecondModalOpen(true);
        setIsFirstModalOpen(false);
    };

    const closeAllModals = () => {
        setIsFirstModalOpen(false);
        setIsSecondModalOpen(false);
    };

    // Проверка токена
    const checkAuth = () => {
        const token = document.cookie.split("; ").find((row) => row.startsWith("access_token="));
        setIsAuthenticated(!!token); // Устанавливаем авторизацию на основе наличия токена
    };

    // Проверяем токен при загрузке
    useEffect(() => {
        checkAuth();
    }, []);

    // Функция для обновления состояния авторизации после входа
    const handleLoginSuccess = () => {
        checkAuth(); // Проверяем токен и обновляем состояние
        closeAllModals(); // Закрываем модалку входа
    };

    return (
        <html className="bg-[#1C1C1C]" lang="en">
        <body
            className={`${geistSans.variable} ${geistMono.variable} antialiased`}
        >
        <>
            <div className="p-6 absolute">
                {/* Первая модалка */}
                {isFirstModalOpen && (
                    <Login
                        closeModal={closeAllModals}
                        openRegister={openSecondModal}
                        onLoginSuccess={handleLoginSuccess} // Вызываем после успешного входа
                    />
                )}

                {/* Вторая модалка */}
                {isSecondModalOpen && (
                    <Registration
                        closeModal={closeAllModals}
                        openLogin={openFirstModal}
                    />
                )}
            </div>
        </>
        <header className="flex bg-[#1C1C1C] h-[10vh] justify-between">
            <div className="flex pl-[73px] pt-[24px]">
                <div>
                    <Image
                        src="/logo.png"
                        alt="Logo"
                        width={50}
                        height={40}
                    />
                </div>
                <span className="ml-2 text-[#FFFFFF] text-[40px]">Mihest</span>
            </div>
            <div className="flex space-x-6 pl-10 text-[24px] justify-center">
                <Link
                    href="/"
                    className={`px-4 py-2 rounded-b-[10px] flex items-center ${
                        pathname === "/" ? "bg-[#DB7038] text-white" : "text-[#FFFFFF]"
                    }`}
                >
                    Главная
                </Link>
                <Link
                    href="/calendar"
                    className={`px-4 py-2 rounded-b-[10px] flex items-center ${
                        pathname === "/calendar" ? "bg-[#DB7038] text-white" : "text-[#FFFFFF]"
                    }`}
                >
                    Календарь
                </Link>
                <Link
                    href="/txt"
                    className={`px-4 py-2 rounded-b-[10px] flex items-center ${
                        pathname === "/txt" ? "bg-[#DB7038] text-white" : "text-[#FFFFFF]"
                    }`}
                >
                    Text
                </Link>
            </div>
            <div className="flex items-center w-[15%] text-[20px]">
                {isAuthenticated ? (
                    <Link
                        href="/profile"
                        className="bg-[#DB7038] w-full text-white px-4 py-2 rounded-l-[10px] text-center"
                    >
                        Профиль
                    </Link>
                ) : (
                    <button
                        className="bg-[#DB7038] w-full text-white px-4 py-2 rounded-l-[10px]"
                        onClick={openFirstModal}
                    >
                        Войти
                    </button>
                )}
            </div>
        </header>
        {children}
        </body>
        </html>
    );
}
