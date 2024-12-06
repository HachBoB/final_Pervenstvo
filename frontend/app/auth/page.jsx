export default function reg() {
    return (
      <div className=" fixed top-0 left-0 right-0 bottom-0 bg-zinc-950 bg-opacity-50 flex justify-center items-center z-20 ">
        <div className="w-1/4 border-[#DB7038] border-2 rounded-[30px] flex shadow-custom bg-[#313131] p-6 bg-[#DD71351A] flex-col ">
          <p className="mb-8 text-center text-[40px]">Вход</p>
          <form action="" className="flex flex-col gap-6">
            <input type="email" name="email" className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none" placeholder="Почта"/>
            <input type="password" name="password" className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-[#DB7038] focus:outline-none" placeholder="Пароль"/>
            <button type="submit" className="bg-[#DB7038] text-white py-2 rounded-[10px] text-[20px] mt-[20%]">Войти</button>
          </form>
          <p className="mt-2 text-center text-[14px]">
            Забыли пароль? <a href="">Восстановить</a>
          </p>
          <p className="mt-2 text-center text-[14px]">
            Еще не зарегестрированы? <a href="">Регистрация</a>
          </p>
        </div>
      </div>
    );
  }
  