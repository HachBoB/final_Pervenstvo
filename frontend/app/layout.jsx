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
    const token = document.cookie
      .split("; ")
      .find((row) => row.startsWith("access_token="));
    setIsAuthenticated(!!token); // Устанавливаем авторизацию на основе наличия токена
  };

  // Проверяем токен при загрузке
  useEffect(() => {
    checkAuth();
  }, []);

  // Функция для обновления состояния авторизации после входа
  const handleLoginSuccess = () => {
    checkAuth(); // Проверяем токен и обновляем состояние
    closeAllModals();
  };

  return (
    <html className="bg-[#1C1C1C]" lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased min-h-screen flex flex-col`}
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
              <Image src="/logo.png" alt="Logo" width={50} height={40} />
            </div>
            <span className="ml-2 text-[#FFFFFF] text-[40px]">Mihest</span>
          </div>
          <div className="flex space-x-6 pl-10 text-[24px] justify-center">
            <Link
              href="/"
              className={`px-4 py-2 rounded-b-[10px] flex items-center transition-all duration-300 ${
                pathname === "/"
                  ? "bg-[#DB7038] text-white"
                  : "bg-transparent text-[#FFFFFF]"
              }`}
            >
              Главная
            </Link>
            <Link
              href="/calendar"
              className={`px-4 py-2 rounded-b-[10px] flex items-center transition-all duration-300 ${
                pathname === "/calendar"
                  ? "bg-[#DB7038] text-white"
                  : "bg-transparent text-[#FFFFFF]"
              }`}
            >
              Календарь
            </Link>
            <Link
              href="/regions"
              className={`px-4 py-2 rounded-b-[10px] flex items-center transition-all duration-300 ${
                pathname === "/regions"
                  ? "bg-[#DB7038] text-white"
                  : "bg-transparent text-[#FFFFFF]"
              }`}
            >
              Регионы
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
        <div className="flex-1 overflow-x-hidden">{children}</div>
        <footer className="bg-[#0000004D] h-[20%] mt-[4%] w-full py-6 px-[15%]">
          <div className="flex gap-[10%] items-center justify-between flex text-white text-[20px]">
            <p>Контакты</p>
            <a href="https://info@fsp-russia.com">info@fsp-russia.com</a>
            <p>+7 (499) 678-03-05</p>
          </div>
          <div className="bg-[#DB7038] h-[1px] w-[100%] mx-auto my-6"></div>
          <div className="flex gap-[10%] items-center justify-between flex text-white text-[15px]">
            <a href="">Политика конфиденциальности</a>
            <a href="">Условия соглашения</a>
            <a href="">©2024</a>
          </div>
        </footer>
      </body>
    </html>
  );
}
