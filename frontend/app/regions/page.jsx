"use client"
import { useState } from "react";
import { motion } from "framer-motion";
import React from "react";
import Image from "next/image";
export default function Accordion() {
    const [isOpen, setIsOpen] = useState(false); // Состояние для открытия/закрытия аккордеона
    const data = [
        { region: "Брянская область", leader: "Казаков Олег Дмитриевич", contact: "bryansk@fsp-russia.com" },
        { region: "Владимирская область", leader: "Лисова Анастасия Андреевна", contact: "vladimir@fsp-russia.com" },
        { region: "Воронежская область", leader: "Ульянов Владимир", contact: "voronezh@fsp-russia.com" },
        { region: "Ивановская область", leader: "Уралов Сергей Дмитриевич", contact: "ivanovo@fsp-russia.com" },
        { region: "Калужская область", leader: "Колесников Алексей", contact: "kaluga@fsp-russia.com" },
    ];
    const toggleAccordion = () => {
        setIsOpen((prev) => !prev);
    };

    return (
        <div className="w-full mx-auto">

            <div className="border border-[#DB7038] rounded-md w-[80%] border-none mx-auto">
                <p className="text-white text-[40px] mt-[1%] mb-[2%]">Регионы</p>
                <button
                    onClick={toggleAccordion} // При клике на кнопку меняем состояние
                    className="w-full text-left p-4 text-white bg-[#2B2B2B] border border-[#DB7038] rounded-[45px] justify-between items-center shadow-custom focus:outline-none flex"
                >
                    Брянская область
                    <div
                        className={`transform transition-transform duration-300 ${
                            isOpen ? "rotate-180" : "rotate-0"
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
                    initial={{ opacity: 0, maxHeight: 0 }} // Начальные значения (скрытый контент)
                    animate={{ opacity: isOpen ? 1 : 0, maxHeight: isOpen ? "200px" : 0 }} // Плавное раскрытие/сжатие
                    transition={{
                        type: "spring",
                        stiffness: 50,
                        damping: 25,
                        duration: 1.2, // Устанавливаем продолжительность анимации для плавности
                    }}
                    className="overflow-hidden  text-white rounded-b-md border-none"
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
                            {data.map((item, index) => (
                                <React.Fragment key={index}>
                                    <tr className="even:bg-gray-800">
                                        <td className="px-4 py-2">{item.region}</td>
                                        <td className="px-4 py-2">{item.leader}</td>
                                        <td className="px-4 py-2">{item.contact}</td>
                                    </tr>
                                    {/* Разделительная линия */}
                                    {index < data.length - 1 && (
                                        <tr>
                                            <td colSpan={3}>
                                                <div className="border-b border-gray-700 mx-4"></div>
                                            </td>
                                        </tr>
                                    )}
                                </React.Fragment>
                            ))}
                            </tbody>
                        </table>
                    </div>
                </motion.div>
            </div>
        </div>
    );
}
