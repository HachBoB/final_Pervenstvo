"use client";
import Image from "next/image";
import React from "react";

export default function eventforall() {
  const handleBack = () => {
    window.history.back();
  };
  return (
    <div>
      <div className="flex text-center gap-4 ml-[4%] text-white">
        <button
          type="button" // Измените на "button" вместо "submit"
          className="bg-[#DB7038] p-4 rounded-[15px]"
          onClick={handleBack}
        >
          <Image src="/left.png" alt="left" width={17} height={17} />
        </button>
        <p className="text-[25px] my-auto">Назад</p>
      </div>
      <div className="flex-col flex items-center justify-center text-white gap-8 mb-[3%]">
        <p className="text-[45px] underline">DevOps HackDay</p>
        <div className="flex gap-[20%] w-[60%] items-center">
          <div className="flex gap-2 items-center border-[#DB7038] border-2 rounded-[20px] p-2 w-[50%] justify-center">
            <Image src="/share.png" alt="share" width={30} height={30} />
            <p className="text-[21px]">Дисциплина</p>
          </div>
          <p className="text-[24px] w-[100%]">
            Автоматизация и администрирование DevOps
          </p>
        </div>
        <div className="flex gap-[20%] w-[60%] items-center">
          <div className="flex gap-2 items-center border-[#DB7038] border-2 rounded-[20px] p-2 w-[50%] justify-center">
            <Image src="/eventformat.png" alt="share" width={30} height={30} />
            <p className="text-[21px]">Формат</p>
          </div>
          <p className="text-[24px] w-[100%]">Онлайн</p>
        </div>
        <div className="flex gap-[20%] w-[60%] items-center">
          <div className="flex gap-2 items-center border-[#DB7038] border-2 rounded-[20px] p-2 w-[50%] justify-center">
            <Image
              src="/eventcalendar.png"
              alt="share"
              width={30}
              height={30}
            />
            <p className="text-[21px]">Дата проведения</p>
          </div>
          <p className="text-[24px] w-[100%]">18.12.2024-20.12.2024</p>
        </div>
        <div className="flex gap-[20%] w-[60%] items-center">
          <div className="flex gap-2 items-center border-[#DB7038] border-2 rounded-[20px] p-2 w-[50%] justify-center">
            <Image src="/eventregion.png" alt="share" width={30} height={30} />
            <p className="text-[21px]">Регион</p>
          </div>
          <p className="text-[24px] w-[100%]">Центральный федеральный округ</p>
        </div>
        <div className="flex gap-[20%] w-[60%] items-center">
          <div className="flex gap-2 items-center border-[#DB7038] border-2 rounded-[20px] p-2 w-[50%] justify-center">
            <Image src="/eventsubject.png" alt="share" width={30} height={30} />
            <p className="text-[21px]">Субъект РФ</p>
          </div>
          <p className="text-[24px] w-[100%]">Брянская область</p>
        </div>
        <div className="flex gap-[20%] w-[60%] items-center">
          <div className="flex gap-2 items-center border-[#DB7038] border-2 rounded-[20px] p-2 w-[50%] justify-center">
            <Image
              src="/eventparticipants.png"
              alt="share"
              width={30}
              height={30}
            />
            <p className="text-[21px]">Участники</p>
          </div>
          <p className="text-[24px] w-[100%]">Юниоры (17-25)</p>
        </div>
      </div>
      <button className="bg-[#DB7038] p-1 rounded-[15px] w-[25%] text-[25px] right-[15%] absolute mt-[-2%]">
        Подписаться на уведомления
      </button>
    </div>
  );
}
