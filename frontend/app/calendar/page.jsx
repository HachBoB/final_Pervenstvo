"use client";
import Image from "next/image";
import React, { useState, useEffect } from "react";

export default function Calendar() {
  const [currentDate, setCurrentDate] = useState(new Date());

  useEffect(() => {
    setCurrentDate(new Date());
  }, []);

  if (!currentDate) {
    return null; // или можно вернуть загрузочный индикатор
  }

  const changeMonth = (delta) => {
    setCurrentDate((prevDate) => {
      const newDate = new Date(prevDate);
      newDate.setMonth(newDate.getMonth() + delta);
      return newDate;
    });
  };

  const daysInMonth = (month, year) => {
    return new Date(year, month + 1, 0).getDate();
  };

  const renderDays = () => {
    const days = [];
    const numDays = daysInMonth(
      currentDate.getMonth(),
      currentDate.getFullYear()
    );
    for (let i = 1; i <= numDays; i++) {
      days.push(
        <div
          key={`day-${i}`} // Используйте уникальный ключ
          className="text-center text-[128px] day shadow-custom bg-[#44444480] rounded-[20px] border-[#DB7038] border-[1px]"
        >
          {i}
        </div>
      );
    }
    return days;
  };

  return (
    <div className="p-[3%] text-white">
      <div className="flex justify-between">
        <div className="flex gap-2 w-[50%]">
          <button
            type="button" // Измените на "button" вместо "submit"
            className="bg-[#DB7038] p-5 rounded-[15px]"
            onClick={() => changeMonth(-1)}
          >
            <Image src="/left.png" alt="left" width={17} height={17} />
          </button>
          <button
            type="button" // Измените на "button" вместо "submit"
            className="bg-[#DB7038] p-5 rounded-[15px]"
            onClick={() => changeMonth(1)}
          >
            <Image src="/right.png" alt="right" width={17} height={17} />
          </button>
          <p className="text-[35px] ml-[3%]">
            {currentDate.toLocaleString("default", {
              month: "long",
              year: "numeric",
            })}
          </p>
        </div>
        <select
          name="filter"
          className="bg-[#DB7038] rounded-[15px] w-[30%] text-[30px] focus:outline-[#DB7038] focus:outline-none px-4"
        >
          <option value="" className="bg-[#444444]">
            По умолчанию
          </option>
        </select>
      </div>
      <div>
        <div className="grid grid-cols-7 gap-6 w-[100%] mt-[3%]">
          {renderDays()}
        </div>
      </div>
    </div>
  );
}
