import Image from "next/image";
import Link from "next/link";

export default function Home() {
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
                    <div className="mt-[4%]">
                        <Link href="/chempID"
                              className="text-white border border-[#FFFFFF] rounded-[10px] w-[250px] h-[52px] flex items-center justify-center"
                        >
                            Подробнее
                        </Link>
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
          <div className="w-full mt-[6%] items-center border-[#DB7038] border-[1px] rounded-[10px] flex shadow-custom bg-[#313131]">
              <div>

              </div>
          </div>
      </div>
  );
}
