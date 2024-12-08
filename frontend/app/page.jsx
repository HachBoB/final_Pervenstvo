"use client";
import Image from "next/image";
import Link from "next/link";
import { useState, useEffect } from "react";
import { motion } from "framer-motion";

export default function Home() {
    const [activeTab, setActiveTab] = useState("active");
    const [allEvents, setAllEvents] = useState([]); // Все события
    const [offset, setOffset] = useState(0);
    const [totalEvents, setTotalEvents] = useState(0);
    const limit = 10;
    const currentDate = new Date();

    // Запрос событий
    const fetchEvents = async () => {
        try {
            console.log("Fetching events with offset:", offset, "and limit:", limit);
            const response = await fetch(
                `https://mihest.ru/api/EventsService/Events?offset=${offset}&limit=${limit}&end_date_gte=${currentDate.toISOString().split("T")[0]}`
            );

            if (!response.ok) {
                throw new Error("Ошибка загрузки данных");
            }

            const data = await response.json();
            console.log("Fetched data:", data);
            setAllEvents(data.events || []);
            setTotalEvents(data.total || 0); // Общий подсчёт событий
        } catch (error) {
            console.error("Ошибка при загрузке данных:", error);
        }
    };

    useEffect(() => {
        fetchEvents();
    }, [offset]);

    // Фильтр событий
    const filteredEvents =
        activeTab === "active"
            ? allEvents.filter((event) => new Date(event.end_date) >= currentDate)
            : allEvents.filter((event) => new Date(event.end_date) < currentDate);

    const nextPage = () => {
        if (offset + limit < totalEvents) {
            setOffset((prev) => prev + limit);
        }
    };

    const prevPage = () => {
        if (offset > 0) {
            setOffset((prev) => prev - limit);
        }
    };

    return (
        <div className="flex-col w-[80%] mx-auto">
            {/* Визуализация события */}
            <div className="w-full mt-[6%] items-center border-[#DB7038] border-[1px] rounded-[10px] flex shadow-custom">
                <div className="ml-[10%] flex-col">
                    <p className="text-[#DB7038] font-sans">Регистрация открыта</p>
                    <p className="text-white text-[30px]">
                        Чемпионат по Спортивному
                        <br />
                        программированию
                    </p>
                    <div className="flex-col rounded-[10px] text-center">
                        <div className="flex gap-[11px]">
                            <div className="w-[58px] h-[58px] items-center rounded-[10px] justify-center flex-col bg-[#D9D9D9] align-middle flex">
                                <>7</>
                                <p>Дек</p>
                            </div>
                            {/* Таймер */}
                            {[["09", "День"], ["11", "Час"], ["03", "Мин"], ["48", "Сек"]].map(
                                ([value, label], idx) => (
                                    <div key={idx}>
                                        <div className="w-[58px] h-[34px] rounded-[10px] items-center justify-center flex bg-[#646464] text-white">
                                            <p>{value}</p>
                                        </div>
                                        <p className="text-white">{label}</p>
                                    </div>
                                )
                            )}
                        </div>
                        <div className="mt-[10%]">
                            <motion.div
                                whileHover={{ scale: 1.05 }}
                                whileTap={{ scale: 0.95 }}
                                transition={{
                                    type: "spring",
                                    stiffness: 400,
                                    damping: 10,
                                }}
                            >
                                <Link
                                    href="/chempID"
                                    className="text-white border border-[#FFFFFF] rounded-[10px] w-[250px] h-[52px] flex items-center justify-center"
                                >
                                    Подробнее
                                </Link>
                            </motion.div>
                        </div>
                    </div>
                </div>
                <div className="ml-[5%]">
                    <Image
                        src="/CompMan.png"
                        alt="Logo"
                        width={99050}
                        height={350}
                        layout="intrinsic"
                    />
                </div>
            </div>

            {/* Таблица событий */}
            <div className="w-full mt-[6%] items-center border-[#DB7038] border-[1px] rounded-[10px] flex-col px-[10%] shadow-custom bg-[#313131]">
                <p className="text-white text-[20px]">События</p>
                <div className="flex mx-auto w-full">
                    <div className="flex-col w-full">
                        {/* Вкладки */}
                        <div className="flex items-center justify-center">
                            <div className="flex bg-gray-800 rounded-full p-1">
                                {["active", "finished"].map((tab) => (
                                    <button
                                        key={tab}
                                        onClick={() => {
                                            setActiveTab(tab);
                                            setOffset(0);
                                        }}
                                        className={`px-6 py-2 rounded-full transition ${
                                            activeTab === tab
                                                ? "bg-orange-500 text-white"
                                                : "text-gray-400"
                                        }`}
                                    >
                                        {tab === "active" ? "Active" : "Finished"}
                                    </button>
                                ))}
                            </div>
                        </div>
                        {/* Таблица */}
                        <div className="p-4 text-white rounded-lg">
                            <table className="table-auto w-full border-collapse">
                                <thead>
                                <tr className="text-left text-gray-400 uppercase">
                                    <th className="py-3 px-4">Num</th>
                                    <th className="py-3 px-4">Name</th>
                                    <th className="py-3 px-4">Start Date</th>
                                    <th className="py-3 px-4">End Date</th>
                                    <th className="py-3 px-4">Quantity</th>
                                    <th className="py-3 px-4"></th>
                                </tr>
                                </thead>
                                <tbody>
                                {filteredEvents.map((item, idx) => (
                                    <tr
                                        key={idx}
                                        className="border-b border-gray-700 hover:bg-gray-800"
                                    >
                                        <td className="py-3 px-4">{idx + 1 + offset}</td>
                                        <td className="py-3 px-4">{item.name || "Без названия"}</td>
                                        <td className="py-3 px-4">{item.start_date}</td>
                                        <td className="py-3 px-4">{item.end_date}</td>
                                        <td className="py-3 px-4">{item.quantity || "N/A"}</td>
                                        <td className="py-3 px-4">
                                            <button className="bg-gray-800 text-white py-2 px-4 rounded-md hover:bg-gray-700">
                                                Подробнее
                                            </button>
                                        </td>
                                    </tr>
                                ))}
                                </tbody>
                            </table>
                        </div>
                        {/* Навигация */}
                        <div className="flex justify-between mt-4">
                            <button
                                onClick={prevPage}
                                disabled={offset <= 0}
                                className="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 disabled:opacity-50"
                            >
                                Предыдущая
                            </button>
                            <button
                                onClick={nextPage}
                                disabled={offset + limit >= totalEvents}
                                className="px-4 py-2 bg-gray-800 text-white rounded-md hover:bg-gray-700 disabled:opacity-50"
                            >
                                Следующая
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
