"use client"
import Image from "next/image";
import Link from "next/link";
import {useState} from "react";
import { motion } from 'framer-motion';
export default function Home() {


    const [activeTab, setActiveTab] = useState("active");
    const data = [
        {
            num: 1,
            name: "Соревнование-1",
            time: "10:00",
            date: "11.12.24",
            quantity: 26,
            status: "Началось",
        },
        {
            num: 2,
            name: "Соревнование-2",
            time: "18:00",
            date: "11.12.24",
            quantity: 10,
            status: "Началось",
        },
    ];
  return (
      <div className="flex-col w-[80%] mx-auto">

          <div className="w-full mt-[6%] items-center border-[#DB7038] border-[1px] rounded-[10px] flex shadow-custom">
            <div className="ml-[10%] flex-col">
                <p className="text-[#DB7038]  font-sans">Регистрация открыта</p>
                <p className="text-white text-[30px]">Чемпионат по Спортивному
                    <br/> программированию</p>
                <div className="flex-col rounded-[10px] text-center">
                    <div className="flex gap-[11px]">
                        <div className="w-[58px] h-[58px] items-center rounded-[10px] justify-center flex-col bg-[#D9D9D9] align-middle flex">
                            <>7</>
                            <p>Дек</p>
                        </div>
                        <div>
                            <div className="w-[58px] h-[34px] rounded-[10px] items-center justify-center flex bg-[#646464] text-white">
                                <p>09</p>
                            </div>
                            <p className="text-white">День</p>
                        </div>
                        <div>
                            <div className="w-[58px] h-[34px] rounded-[10px] items-center justify-center flex bg-[#646464] text-white">
                                <p>11</p>
                            </div>
                            <p className="text-white">Час</p>
                        </div>
                        <div>
                            <div className="w-[58px] h-[34px] rounded-[10px] items-center justify-center flex bg-[#646464] text-white">
                                <p>03</p>
                            </div>
                            <p className="text-white">Мин</p>
                        </div>
                        <div>
                            <div className="w-[58px] h-[34px] rounded-[10px] items-center justify-center flex bg-[#646464] text-white">
                                <p>48</p>
                            </div>
                            <p className="text-white">Сек</p>
                        </div>
                    </div>

                    <div className="mt-[10%]">
                        {/* Оборачиваем Link в motion.div для анимации */}
                        <motion.div
                            whileHover={{ scale: 1.05 }}  // Увеличиваем размер при наведении
                            whileTap={{ scale: 0.95 }}    // Уменьшаем при нажатии
                            transition={{ type: "spring", stiffness: 400, damping: 10 }}  // Анимация с физикой
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
                      height={350} // Задайте соотношение сторон, Next.js это использует для расчета
                      layout="intrinsic"
                  />
              </div>
          </div>

          <div className="w-full mt-[6%] items-center border-[#DB7038] border-[1px] rounded-[10px] flex-col px-[10%] shadow-custom bg-[#313131]">
              <p className="text-white text-[20px]">События</p>
              <div className="flex mx-auto w-full">
                  <div className="flex-col w-full">
                      <div className="flex items-center justify-center">
                          <div className="flex bg-gray-800 rounded-full p-1">
                              <button
                                  onClick={() => setActiveTab("active")}
                                  className={`px-6 py-2 rounded-full transition ${
                                      activeTab === "active"
                                          ? "bg-orange-500 text-white"
                                          : "text-gray-400"
                                  }`}
                              >
                                  Active
                              </button>
                              <button
                                  onClick={() => setActiveTab("finished")}
                                  className={`px-6 py-2 rounded-full transition ${
                                      activeTab === "finished"
                                          ? "bg-gray-700 text-white"
                                          : "text-gray-400"
                                  }`}
                              >
                                  Finished
                              </button>
                          </div>
                      </div>
                      <div className="p-4 text-white rounded-lg">
                          <table className="table-auto w-full border-collapse">
                              <thead>
                              <tr className="text-left text-gray-400 uppercase">
                                  <th className="py-3 px-4">Num</th>
                                  <th className="py-3 px-4">Name</th>
                                  <th className="py-3 px-4">Time</th>
                                  <th className="py-3 px-4">Quantity</th>
                                  <th className="py-3 px-4">Date</th>
                                  <th className="py-3 px-4">Status</th>
                                  <th className="py-3 px-4"></th>
                              </tr>
                              </thead>
                              <tbody>
                              {data.map((item, index) => (
                                  <tr
                                      key={index}
                                      className="border-b border-gray-700 hover:bg-gray-800"
                                  >
                                      <td className="py-3 px-4">{item.num}</td>
                                      <td className="py-3 px-4">{item.name}</td>
                                      <td className="py-3 px-4">{item.time}</td>
                                      <td className="py-3 px-4">{item.date}</td>
                                      <td className="py-3 px-4">{item.quantity}</td>
                                      <td className="py-3 px-4 text-green-500">{item.status}</td>
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
                  </div>
              </div>
          </div>
      </div>
  );
}
