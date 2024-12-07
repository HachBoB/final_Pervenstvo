import Image from "next/image";
import ImageUpload from "@/app/personal/ClientComponent";

export default function Personal() {
  return (
    <div className="flex gap-[4%] mt-[2.5%] text-white">
      <div className="border-[#DB7038] border-t-2 border-r-2 border-b-2 rounded-r-[20px] shadow-custom w-[20%] items-center flex flex-col gap-6 py-[2.5%] px-3 bg-[#44444461]">
        <button
          type="submit"
          className="border-[#DB7038] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
        >
          Личная информация
        </button>
        <button
          type="submit"
          className="border-[#DB7038] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
        >
          Новый заявки
        </button>
        <button
          type="submit"
          className="border-[#DB7038] border-2 rounded-[10px] shadow-custom p-3 text-[30px] w-[100%] text-center"
        >
          Отклоненные заявки
        </button>
      </div>
      <div className="border-[#DB7038] border-2 rounded-l-[20px] flex flex-col shadow-custom w-[30%] py-[2.5%] items-center bg-[#44444461]">
        <div>
          <div className="border-[#DB7038] border-2 shadow-custom rounded-full justify-center items-center flex w-[280px] h-[280px] bg-[#444444]">
            <Image
              src="/avatarzero.png"
              alt="avatar"
              width={100}
              height={100}
              className=""
            />
          </div>
          {/* <ImageUpload /> */}
        </div>
        <div className="flex mt-[8%]">
          <p className="text-[30px]">User</p>
          <p className="text-[20px] text-[#CF4242]">Суперадмин</p>
        </div>
        <div className="bg-[#DB7038] w-[50%] h-[1px] mt-[2%]"></div>
        <p className="text-[30px] mt-[5%] text-[#DB7038]">Статистика</p>
      </div>
      <div className="border-[#DB7038] border-2 rounded-r-[20px] flex shadow-custom w-[40%] bg-[#44444461] px-[3%] py-[1.5%] flex flex-col gap-6 ">
        <p className="text-[40px]">Личные данные</p>
        <form action="" className="flex flex-col gap-4 ">
          <p className="text-[27px] text-[#DB7038]">Основаная информация</p>
          <div className="flex gap-6">
            <input
              type="text"
              name="name"
              className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
              placeholder="Имя"
            />
            <input
              type="text"
              name="surname"
              className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
              placeholder="Фамилия"
            />
          </div>
          <div className="flex gap-6">
            <input
              type="text"
              name="patronymic"
              className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
              placeholder="Отчество"
            />
            <input
              type="date"
              name="birthday"
              className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
            />
          </div>
          <div className="flex gap-6">
            <select
              name="gender"
              className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
            >
              <option className="bg-[#444444]" value="male">
                Мужской
              </option>
              <option className="bg-[#444444]" value="female">
                Женский
              </option>
            </select>
            <input
              type="text"
              name="region"
              className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
              placeholder="Регион"
            />
          </div>
          <div className="flex flex-col gap-4">
            <p className="text-[27px] text-[#DB7038]">Контактные данные</p>
            <div className="flex gap-6">
              <input
                type="email"
                name="email"
                placeholder="Почта"
                className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
              />
              <button
                type="submit"
                className="bg-[#DB7038] text-white  rounded-[10px] text-[18px] w-[50%]"
              >
                Подтвердить
              </button>
            </div>
            <input
              type="tel"
              name="phone"
              placeholder="Телефон"
              className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[48%]"
            />
          </div>
          <div>
            <p className="text-[27px] text-[#DB7038]">Пароль</p>
            <div className="flex gap-6">
              <input
                type="password"
                name="password"
                placeholder="Пароль"
                className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
              />
              <input
                type="password"
                name="confirmPassword"
                placeholder="Подтверждение пароля"
                className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none placeholder:text-white w-[50%]"
              />
            </div>
          </div>
          <button
            type="submit"
            className="bg-[#DB7038] text-white py-2 rounded-[10px] text-[24px] w-[60%] mx-auto mt-10"
          >
            Редактировать
          </button>
        </form>
      </div>
    </div>
  );
}
