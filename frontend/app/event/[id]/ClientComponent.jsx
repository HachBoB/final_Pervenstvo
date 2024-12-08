"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation"; // Для перенаправления на страницу с деталями события

export default function EventPage({ event }) {
    // Используем React.use() для извлечения параметров// Используем params через React.use()
    console.log(event)

    return (
        <div className="p-8 text-white bg-[#333]">
            <div className="max-w-4xl mx-auto bg-[#444444] rounded-lg p-6 shadow-lg">
                <h1 className="text-4xl font-bold text-center mb-4">{event[0].name}</h1>
                <p className="text-lg mb-4">Локация: {event[0].location}</p>
                <p className="text-lg mb-4">Дата начала: {event[0].start_date}</p>
                <p className="text-lg mb-4">Дата окончания: {event[0].end_date}</p>
                <p className="text-lg mb-4">Формат: {event[0].format}</p>
                <p className="text-lg mb-4">Количество участников: {event[0].quantity}</p>
                <p className="text-lg mb-4">Регион: {event[0].region}</p>
                {event.report_path && (
                    <div className="mt-4">
                        <a
                            href={event.report_path}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="text-[#DB7038] underline"
                        >
                            Скачать отчет
                        </a>
                    </div>
                )}
            </div>
            <div className="mt-6 text-center">
                <button
                    onClick={() => useRouter().push("/calendar")} // Перенаправление на календарь
                    className="bg-[#DB7038] px-6 py-2 rounded-full text-white mt-4"
                >
                    Вернуться в календарь
                </button>
            </div>
        </div>
    );
}
