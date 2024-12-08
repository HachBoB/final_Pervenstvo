"use client";
import Image from "next/image";
import {useState, useTransition} from "react";
import {updateUserData} from "@/app/api/userAct";

export default function ProfileClientComponent({new_events, userData, token}) {
    const [formData, setFormData] = useState({
        name: userData.role.name || "",
        first_name: userData.first_name || "",
        last_name: userData.last_name || "",
        patronymic: userData.patronymic || "",
        is_man: userData.is_man === "Мужской",
        region: userData.region || "",
        email: userData.email || "",
        number: userData.number || "",
        password: "",
        confirm_password: "",
    });
    const handleStatusChange = async (eventId, newStatus) => {
        try {
            const response = await fetch(`https://mihest.ru/api/EventsService/Events/${newStatus}/${eventId}`, {
                method: "POST", // Или другой метод в зависимости от API
                headers: {
                    "Content-Type": "application/json",
                    Authorization: `Bearer ${token}`, // Токен для авторизации
                },
            });

            if (!response.ok) {
                throw new Error("Ошибка при обновлении статуса");
            }

            console.log(`Статус события ${eventId} успешно обновлен на ${newStatus}`);
        } catch (error) {
            console.error("Ошибка при обновлении статуса:", error);
        }
    };

    const [isPending, startTransition] = useTransition();
    const [error, setError] = useState("");

    const handleInputChange = (e) => {
        const {name, value} = e.target;
        setFormData({...formData, [name]: value});
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError("");

        if (formData.password !== formData.confirm_password) {
            setError("Пароли не совпадают.");
            return;
        }

        // Исключаем поле `name`
        const {name, ...updatedFormData} = formData;

        startTransition(async () => {
            try {
                await updateUserData(token, updatedFormData); // Используем объект без `name`
                alert("Данные успешно обновлены!");
            } catch (err) {
                setError(err.message || "Ошибка при обновлении данных.");
            }
        });
    };

    const [activeBlock, setActiveBlock] = useState("block1");

    const handleButtonClick = (block) => {
        setActiveBlock(block);
    };

    console.log(new_events)

    return (
        <div className="flex gap-[4%] mt-[2.5%] text-white ">
            <div
                className="border-[#DB7038] flex h-full border-t-2 border-r-2 border-b-2 rounded-r-[20px] shadow-custom w-[21%] items-center flex flex-col gap-6 py-[2.5%] px-3 bg-[#44444461]">
                <button
                    onClick={() => handleButtonClick("block1")}
                    type="submit"
                    className={
                        activeBlock === "block1"
                            ? "border-[#DB7038] bg-[#20150F80] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
                            : "border-[#DB7038] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
                    }
                >
                    Личная информация
                </button>
                {formData?.name === "Super admin" ? (
                    <>
                        <button
                            onClick={() => handleButtonClick("block2")}
                            type="submit"
                            className={
                                activeBlock === "block2"
                                    ? "border-[#DB7038] bg-[#20150F80] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
                                    : "border-[#DB7038] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
                            }
                        >
                            Новый заявки
                        </button>
                        <button
                            onClick={() => handleButtonClick("block3")}
                            type="submit"
                            className={
                                activeBlock === "block3"
                                    ? "border-[#DB7038] bg-[#20150F80] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
                                    : "border-[#DB7038] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
                            }
                        >
                            Отклоненные заявки
                        </button>
                    </>
                ) : (<></>)}
            </div>
            {/* Центр с аватаром */}
            {activeBlock === "block1" && (
                <>
                    <div
                        className="border-[#DB7038] border-2 rounded-l-[20px] flex flex-col shadow-custom w-[29%] py-[2.5%] items-center bg-[#44444461]">
                        <div>
                            <div
                                className="border-[#DB7038] border-2 shadow-custom rounded-full justify-center items-center flex w-[280px] h-[280px] bg-[#444444]">
                                <Image
                                    src="/avatarzero.png"
                                    alt="avatar"
                                    width={100}
                                    height={100}
                                    className=""
                                />
                            </div>
                        </div>
                        <div className="flex mt-[8%]">
                            <p className="text-[30px]">{formData.first_name || "User"}</p>
                            <p className="text-[20px] text-[#CF4242]">
                                {formData.name || "User"}
                            </p>
                        </div>
                        <div className="bg-[#DB7038] w-[50%] h-[1px] mt-[2%]"></div>
                        <p className="text-[30px] mt-[5%] text-[#DB7038]">Статистика</p>
                    </div>
                    {/* Форма */}
                    <div
                        className="border-[#DB7038] border-2 rounded-r-[20px] ml-[1.5%] shadow-custom w-[40%] bg-[#44444461] px-[3%] py-[1.5%] flex flex-col gap-6 ">
                        <p className="text-[40px]">Личные данные</p>
                        {error && <p className="text-red-500">{error}</p>}
                        <form onSubmit={handleSubmit} className="flex flex-col gap-4">
                            <p className="text-[27px] text-[#DB7038]">Основная информация</p>
                            <div className="flex gap-6">
                                <input
                                    type="text"
                                    name="first_name"
                                    value={formData.first_name}
                                    onChange={handleInputChange}
                                    placeholder="Имя"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                                <input
                                    type="text"
                                    name="last_name"
                                    value={formData.last_name}
                                    onChange={handleInputChange}
                                    placeholder="Фамилия"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                            </div>
                            <div className="flex gap-6">
                                <input
                                    type="text"
                                    name="patronymic"
                                    value={formData.patronymic}
                                    onChange={handleInputChange}
                                    placeholder="Отчество"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                            </div>
                            <div className="flex gap-6">
                                <select
                                    name="is_man"
                                    value={formData.is_man}
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                >
                                    <option className="bg-[#444444]">Мужской</option>
                                    <option className="bg-[#444444]">Женский</option>
                                </select>
                                <input
                                    type="text"
                                    name="region"
                                    value={formData.region}
                                    onChange={handleInputChange}
                                    placeholder="Регион"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                            </div>

                            <p className="text-[27px] text-[#DB7038] mt-4">
                                Контактные данные
                            </p>
                            <div className="flex gap-6">
                                <input
                                    type="email"
                                    name="email"
                                    value={formData.email}
                                    onChange={handleInputChange}
                                    placeholder="Почта"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                                <input
                                    type="tel"
                                    name="number"
                                    value={formData.number}
                                    onChange={handleInputChange}
                                    placeholder="Телефон"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                            </div>

                            <p className="text-[27px] text-[#DB7038] mt-4">Пароль</p>
                            <div className="flex gap-6">
                                <input
                                    type="password"
                                    name="password"
                                    value={formData.password}
                                    onChange={handleInputChange}
                                    placeholder="Пароль"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                                <input
                                    type="password"
                                    name="confirm_password"
                                    value={formData.confirm_password}
                                    onChange={handleInputChange}
                                    placeholder="Подтверждение пароля"
                                    className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none placeholder:text-white w-[50%]"
                                />
                            </div>

                            <button
                                type="submit"
                                className="bg-[#DB7038] text-white py-2 rounded-[10px] text-[24px] w-[60%] mx-auto mt-10"
                                disabled={isPending}
                            >
                                {isPending ? "Сохранение..." : "Редактировать"}
                            </button>
                        </form>
                    </div>
                </>
            )}
            {activeBlock === "block2" && (
                <div
                    className="w-[73%] items-center border-[#DB7038] border-[1px] rounded-[10px] flex-col px-[3%] shadow-custom bg-[#313131]">
                    <p className="text-white text-[20px] mt-[4%]">Новые заявки</p>
                    <div className="flex mx-auto w-full">
                        <div className="flex-col w-full">
                            <div className="p-4 text-white rounded-lg">
                                <table className="table-auto w-full border-collapse">
                                    <thead>
                                    <tr className="text-left text-gray-400 uppercase">
                                        <th className="py-3 px-4">Num</th>
                                        <th className="py-3 px-4">Name</th>
                                        <th className="py-3 px-4">Subject RF</th>
                                        <th className="py-3 px-4">Status</th>
                                        <th className="py-3 px-4"></th>
                                    </tr>
                                    </thead>
                                    {new_events.map((item, i) => (
                                            <tbody key={i}>
                                            <tr className="border-b border-gray-700 hover:bg-gray-800">
                                                <td className="py-3 px-4">{i + 1}</td>
                                                <td className="py-3 px-4">{item.name}</td>
                                                <td className="py-3 px-4">{item.location}</td>
                                                <td className="py-3 px-4 text-[#DB7038] ">
                                                    <select
                                                        onChange={(e) => handleStatusChange(item.id, e.target.value)}
                                                        name="status"
                                                        id=""
                                                        defaultValue="В рассмотрении"
                                                        className="bg-transparent focus:text-white focus:outline-none focus:border-[#DB7038]"
                                                    >
                                                        <option
                                                            value="e1aad360-47ed-4205-9e03-19f53f893017"
                                                            className="bg-[#20150F] "
                                                        >
                                                            В рассмотрении
                                                        </option>
                                                        <option
                                                            value="Confirm"
                                                            className="bg-[#20150F] "
                                                        >
                                                            Опубликовать
                                                        </option>
                                                        <option
                                                            value="Cancel"
                                                            className="bg-[#20150F] "
                                                        >
                                                            Отклонить
                                                        </option>
                                                    </select>
                                                </td>
                                                <td className="py-3 px-4">
                                                    <a href={`/event/${item.id}`}
                                                        className="bg-gray-800 text-white py-2 px-4 rounded-md hover:bg-gray-700">
                                                        Подробнее
                                                    </a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        )
                                    )}
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            )}
            {activeBlock === "block3" && (
                <div>
                    <h2>Блок 3</h2>
                    <p>Содержимое блока 3.</p>
                </div>
            )}
        </div>
    );
}
