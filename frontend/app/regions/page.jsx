"use client";
import { useState, useEffect } from "react";
import { motion } from "framer-motion";
import Image from "next/image";

export default function Accordion() {
    const [regions, setRegions] = useState([]); // Данные из API
    const [loading, setLoading] = useState(true); // Состояние загрузки
    const [error, setError] = useState(null); // Состояние ошибки
    const [openIndexes, setOpenIndexes] = useState({}); // Хранение состояния каждого аккордеона

    useEffect(() => {
        // Функция для получения данных с сервера
        const fetchRegions = async () => {
            try {
                const response = await fetch("https://mihest.ru/api/AccService/District");
                if (!response.ok) {
                    throw new Error("Не удалось загрузить данные.");
                }
                const data = await response.json();

                // Преобразуем данные в подходящий формат
                const formattedData = data.map((district) => ({
                    name: district.name,
                    users: district.users.map((user) => ({
                        region: user.region,
                        leader: `${user.last_name || ""} ${user.first_name || ""} ${user.patronymic || ""}`.trim(),
                        contact: user.email,
                    })),
                }));

                setRegions(formattedData);
            } catch (err) {
                setError(err.message);
            } finally {
                setLoading(false);
            }
        };

        fetchRegions();
    }, []);

    const toggleAccordion = (index) => {
        setOpenIndexes((prev) => ({
            ...prev,
            [index]: !prev[index], // Переключаем состояние текущего аккордеона
        }));
    };

    if (loading) return <p className="text-white">Загрузка...</p>;
    if (error) return <p className="text-red-500">Ошибка: {error}</p>;

    return (
        <div className="w-full mx-auto">
            <div className="border border-[#DB7038] rounded-md w-[80%] border-none mx-auto">
                <p className="text-white text-[40px] mt-[1%] mb-[2%]">Регионы</p>
                {regions.map((region, regionIndex) => (
                    <div key={regionIndex} className="mb-4">
                        <button
                            onClick={() => toggleAccordion(regionIndex)} // Открываем/закрываем конкретный аккордеон
                            className="w-full text-left p-4 text-white text-[20px] bg-[#2B2B2B] border border-[#DB7038] rounded-[45px] justify-between items-center shadow-custom focus:outline-none flex"
                        >
                            {region.name}
                            <div
                                className={`transform transition-transform duration-300 ${
                                    openIndexes[regionIndex] ? "rotate-180" : "rotate-0"
                                }`}
                            >
                                <Image
                                    src="/open.png"
                                    alt="Logo"
                                    width={50}
                                    height={40}
                                />
                            </div>
                        </button>

                        <motion.div
                            initial={{ opacity: 0, maxHeight: 0 }}
                            animate={{
                                opacity: openIndexes[regionIndex] ? 1 : 0,
                                maxHeight: openIndexes[regionIndex] ? "1000px" : 0, // Увеличиваем высоту
                            }}
                            transition={{
                                type: "spring",
                                stiffness: 50,
                                damping: 15,
                                duration: 2.2,
                            }}
                            className="overflow-hidden text-white rounded-b-md border-none px-4 py-2" // Добавляем отступы
                        >
                            <div className="overflow-x-auto">
                                <table className="min-w-full table-auto text-white">
                                    <thead>
                                    <tr className="text-[#F09D51]">
                                        <th className="px-4 py-2 text-left">Субъект РФ</th>
                                        <th className="px-4 py-2 text-left">Руководитель</th>
                                        <th className="px-4 py-2 text-left">Контакты</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {region.users.map((user, userIndex) => (
                                        <tr key={userIndex}>
                                            <td className="px-4 py-2">{user.region}</td>
                                            <td className="px-4 py-2">{user.leader}</td>
                                            <td className="px-4 py-2">{user.contact}</td>
                                        </tr>
                                    ))}
                                    </tbody>
                                </table>
                            </div>
                        </motion.div>
                    </div>
                ))}
            </div>
        </div>
    );
}
