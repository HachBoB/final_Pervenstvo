"use client";

import Image from "next/image";
import React, { useState, useEffect } from "react";
import { useRouter } from "next/navigation"; // Для перенаправления на страницу с деталями события

export default function Calendar() {
  const [currentDate, setCurrentDate] = useState(new Date());
  const [events, setEvents] = useState([]);
  const [selectedLocation, setSelectedLocation] = useState("");
  const [hoveredDate, setHoveredDate] = useState(null);
  const [locations, setLocations] = useState([]);
  const [tooltipPosition, setTooltipPosition] = useState({ top: 0, left: 0 });
  const [isHoveringTooltip, setIsHoveringTooltip] = useState(false); // Для проверки, находитесь ли вы на окошке с информацией

  const router = useRouter();

  const loadEvents = async () => {
    const start = `${currentDate.getFullYear()}-${String(
        currentDate.getMonth() + 1
    ).padStart(2, "0")}-01`;
    const end = `${currentDate.getFullYear()}-${String(
        currentDate.getMonth() + 1
    ).padStart(2, "0")}-${new Date(
        currentDate.getFullYear(),
        currentDate.getMonth() + 1,
        0
    ).getDate()}`;

    try {
      const url = `${process.env.NEXT_PUBLIC_BACKEND_HOST}/api/EventsService/Events?start_date_gte=${start}&end_date_lte=${end}${
          selectedLocation ? `&location=${selectedLocation}` : ""
      }`;

      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`Ошибка при загрузке событий: ${response.status}`);
      }

      const data = await response.json();
      setEvents(data);
    } catch (error) {
      console.error("Ошибка при получении событий:", error);
      setEvents([]);
    }
  };

  const loadLocations = async () => {
    try {
      const response = await fetch(`${process.env.NEXT_PUBLIC_BACKEND_HOST}/api/EventsService/Events`);
      if (!response.ok) {
        throw new Error("Ошибка загрузки локаций");
      }

      const data = await response.json();
      const uniqueLocations = Array.from(
          new Set(data.map((item) => item.location).filter((location) => location))
      );

      setLocations(uniqueLocations);
    } catch (error) {
      console.error("Ошибка при загрузке локаций:", error);
      setLocations([]);
    }
  };

  useEffect(() => {
    loadEvents();
    loadLocations();
  }, [currentDate, selectedLocation]);

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
    const numDays = daysInMonth(currentDate.getMonth(), currentDate.getFullYear());
    const days = [];

    for (let i = 1; i <= numDays; i++) {
      const dateString = `${currentDate.getFullYear()}-${String(
          currentDate.getMonth() + 1
      ).padStart(2, "0")}-${String(i).padStart(2, "0")}`;

      const dayEvents = events.filter(
          (event) => event.start_date === dateString || event.end_date === dateString
      );

      days.push(
          <div
              key={`day-${i}`}
              className="relative text-center text-[128px] day shadow-custom bg-[#44444480] rounded-[20px] border-[#DB7038] border-[1px] hover:bg-[#DB7038] cursor-pointer transition-all duration-300 transform hover:scale-105"
              onMouseEnter={(e) => {
                const { top, left, width, height } = e.target.getBoundingClientRect(); // Получаем положение дня
                setHoveredDate({ date: dateString, events: dayEvents });

                // Определяем позицию окна
                const tooltipLeft = left + width / 2; // Центрируем окно по горизонтали

                // Получаем размеры окна
                const windowWidth = window.innerWidth;
                const tooltipWidth = 250; // Ширина окна

                // Проверяем, есть ли место справа или слева от дня для отображения окна
                const spaceLeft = tooltipLeft - tooltipWidth / 2;
                const spaceRight = windowWidth - (tooltipLeft + tooltipWidth / 2);

                let adjustedLeft = tooltipLeft;

                // Если нет места справа, сдвигаем влево
                if (spaceRight < 0) {
                  adjustedLeft = windowWidth - tooltipWidth - 10; // Сдвигаем влево
                }
                // Если нет места слева, сдвигаем вправо
                else if (spaceLeft < 0) {
                  adjustedLeft = tooltipWidth / 2 + 10; // Сдвигаем вправо
                }

                setTooltipPosition({
                  top: top + height + 10, // Позиция окна ниже плитки с отступом
                  left: adjustedLeft, // Корректируем горизонтальную позицию
                });
              }}
              onMouseLeave={() => {
                if (!isHoveringTooltip) {
                  setHoveredDate(null);
                }
              }}
          >
            {i}
            {dayEvents.length > 0 && (
                <div className="absolute top-1 right-1 text-sm text-white bg-red-500 rounded-full w-5 h-5 flex items-center justify-center">
                  {dayEvents.length}
                </div>
            )}
          </div>
      );
    }
    return days;
  };

  const handleTooltipMouseEnter = () => {
    setIsHoveringTooltip(true);
  };

  const handleTooltipMouseLeave = () => {
    setIsHoveringTooltip(false);
    setHoveredDate(null); // Закрываем tooltip если не наведен на него
  };

  const handleMoreInfoClick = (eventId) => {
    router.push(`/event/${eventId}`); // Перенаправляем на страницу с деталями события
  };

  return (
      <div className="p-[3%] text-white">
        <div className="flex justify-between">
          <div className="flex gap-2 w-[50%]">
            <button
                type="button"
                className="bg-[#DB7038] p-5 rounded-[15px]"
                onClick={() => changeMonth(-1)}
            >
              <Image src="/left.png" alt="left" width={17} height={17} />
            </button>
            <button
                type="button"
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
              onChange={(e) => setSelectedLocation(e.target.value)}
          >
            <option value="" className="bg-[#444444]">
              Все локации
            </option>
            {locations.map((location, index) => (
                <option key={index} value={location} className="bg-[#444444]">
                  {location}
                </option>
            ))}
          </select>
        </div>
        <div>
          <div className="grid grid-cols-7 gap-6 w-[100%] mt-[3%]">
            {renderDays()}
          </div>
        </div>
        {hoveredDate && (
            <div
                className="absolute flex"
                style={{
                  top: tooltipPosition.top + "px",
                  left: tooltipPosition.left + "px",
                  transform: "translateX(-50%)", // Центрируем окошко относительно дня
                  background: "#444444",
                  padding: "10px",
                  borderRadius: "10px",
                  color: "white",
                  boxShadow: "0 0 10px rgba(0, 0, 0, 0.5)",
                  zIndex: 10,
                  width: "250px", // Ширина окна
                  transition: "opacity 0.3s ease-in-out", // Плавное появление
                  opacity: 1,
                }}
                onMouseEnter={handleTooltipMouseEnter}
                onMouseLeave={handleTooltipMouseLeave}
            >
              {hoveredDate.events.length > 0 ? (
                  hoveredDate.events.map((event, idx) => (
                      <div className="mr-[5px] flex-col content-stretch w-auto min-w-[400px] flex-wrap h-auto mx-auto p-4 bg-[#1C1C1C] items-center justify-center text-center " key={idx}>
                        <p className="text-center text-[#DB7038] text-[20px]">Мероприятие</p>
                        <div className="w-80% h-[1px] bg-[#DB7038] my-[6%]"></div>
                        <p>{event.name}</p>
                        <div className="flex items-center justify-center">
                          <Image
                              src="/cal1.png"
                              alt="calendar"
                              width={17}
                              height={17}
                              className="mr-2"
                          />
                          <p>{event.start_date}</p>
                        </div>
                        <div className="flex items-center justify-center">
                          <Image
                              src="/cal2.png"
                              alt="calendar"
                              width={17}
                              height={17}
                              className="mr-2"
                          />
                          <p>Локация: {event.location}</p>
                        </div>
                        <button
                            onClick={() => handleMoreInfoClick(event.id)}
                            className="bg-[#DB7038] text-white px-4 py-2 mt-2 rounded-[10px]"
                        >
                          Подробнее
                        </button>
                      </div>
                  ))
              ) : (
                  <p>Нет событий</p>
              )}
            </div>
        )}
      </div>
  );
}
