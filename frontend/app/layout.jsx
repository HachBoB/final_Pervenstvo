"use client"
import localFont from "next/font/local";
import "./globals.css";
import Image from "next/image";
import Link from "next/link"; // Используем Link для навигации
import { usePathname } from "next/navigation"; // Определение текущего пути

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
    const pathname = usePathname(); // Получение текущего пути

    return (
        <html className="bg-[#1C1C1C]" lang="en">
        <body
            className={`${geistSans.variable} ${geistMono.variable} antialiased`}
        >
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
                <Link href="/login"
                      className="bg-[#DB7038] w-full text-white px-4 py-2 rounded-l-[10px]"
                >
                    Войти
                </Link>
            </div>
        </header>
        {children}
        </body>
        </html>
    );
}