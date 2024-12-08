"use client";
import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import Image from "next/image";

// Функция возврата назад
const handleBack = () => {
    window.history.back();
};

// Функция для получения токена из куков


export default function EventPage({ event, id, token}) {
    const router = useRouter(); // Для перенаправления


    const LetterMail = async () => {
        if (!token) {
            console.log(token)
            console.error("Токен не найден!");
            return;
        }

        if (!event[0] || !id) {
            console.error("Недостаточно данных для отправки уведомления.");
            return;
        }

        try {
            const { start_date, name: events_name } = event[0];

            // Получаем email пользователя один раз
            const emailResponse = await fetch(`https://mihest.ru/api/AccService/Accounts/Me`, {
                headers: {
                    Authorization: `Bearer ${token}`,
                },
            });

            if (!emailResponse.ok) {
                throw new Error(`Ошибка при получении email: ${emailResponse.status}`);
            }

            const { email } = await emailResponse.json(); // Читаем тело ответа и сохраняем

            // Отправляем уведомление
            const response = await fetch(
                `https://mihest.ru/api/NotificationService/Notification/Events/${id}`,
                {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        Authorization: `Bearer ${token}`,
                    },
                    body: JSON.stringify({
                        email,
                        start_date,
                        events_name,
                    }),
                }
            );

            if (!response.ok) {
                throw new Error(`Ошибка при отправке уведомления: ${response.status}`);
            }

            console.log("Уведомление успешно отправлено");
            router.push("/"); // Переход на главную страницу
        } catch (error) {
            console.error("Ошибка при отправке уведомления:", error);
        }
    };

    return (
        <div>
            {/* Кнопка назад */}
            <div className="flex text-center gap-4 ml-[4%] text-white">
                <button
                    type="button"
                    className="bg-[#DB7038] p-4 rounded-[15px]"
                    onClick={handleBack}
                >
                    <Image src="/left.png" alt="left" width={17} height={17} />
                </button>
                <p className="text-[25px] my-auto">Назад</p>
            </div>

            {/* Данные о событии */}
            <div className="flex-col flex items-center justify-center text-white gap-8 mb-[3%]">
                <p className="text-[45px] text-center w-[70%] underline">
                    {event[0]?.name || "Название отсутствует"}
                </p>
                {[
                    { label: "Дисциплина", value: event[0]?.discipline, icon: "/share.png" },
                    { label: "Формат", value: event[0]?.format, icon: "/eventformat.png" },
                    {
                        label: "Дата проведения",
                        value: `${event[0]?.start_date || "?"} - ${
                            event[0]?.end_date || "?"
                        }`,
                        icon: "/eventcalendar.png",
                    },
                    { label: "Регион", value: event[0]?.region || "Не указан", icon: "/eventregion.png" },
                    { label: "Субъект РФ", value: event[0]?.location || "Не указан", icon: "/eventsubject.png" },
                    { label: "Участники", value: event[0]?.quantity || "Не указаны", icon: "/eventparticipants.png" },
                ].map((item, idx) => (
                    <div className="flex gap-[20%] w-[60%] items-center" key={idx}>
                        <div className="flex gap-2 items-center border-[#DB7038] border-2 rounded-[20px] p-2 w-[50%] justify-center">
                            <Image src={item.icon} alt={item.label} width={30} height={30} />
                            <p className="text-[21px]">{item.label}</p>
                        </div>
                        <p className="text-[24px] w-[100%]">{item.value}</p>
                    </div>
                ))}
            </div>

            {/* Кнопка подписки */}
            <button
                onClick={LetterMail}
                className="bg-[#DB7038] p-1 rounded-[15px] w-[25%] text-[25px] right-[15%] absolute mt-[-2%]"
            >
                Подписаться на уведомления
            </button>
        </div>
    );
}
