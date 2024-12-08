import { useState } from "react";
import axios from "axios";
import process from "next/dist/build/webpack/loaders/resolve-url-loader/lib/postcss";

export default function Registration({ closeModal, openLogin }) {
  const [formData, setFormData] = useState({
    first_name: "",
    email: "",
    password: "",
    confirm_password: "",
  });
  const [error, setError] = useState("");

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");

    if (formData.password !== formData.confirm_password) {
      setError("Пароли не совпадают");
      return;
    }

    try {
      const response = await axios.post(`${process.env.NEXT_PUBLIC_BACKEND_HOST}/api/AccService/Authentication/SignUp`, {
        first_name: formData.first_name,
        email: formData.email,
        password: formData.password,
        confirm_password: formData.confirm_password,
      }, {
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json"
        },
      });
      console.log(document.cookie)
      closeModal();
      document.cookie = `access_token=${response.data.access_token}; path=/; max-age=2592000`;
      document.cookie = `refresh_token=${response.data.refresh_token}; path=/; max-age=2592000`;
    } catch (err) {
      console.log(err.response)
    }
  };

  return (
      <div
          className="fixed top-0 left-0 right-0 bottom-0 bg-zinc-950 bg-opacity-80 flex justify-center items-center z-20"
          onClick={(e) => e.target === e.currentTarget && closeModal()}
      >
        <div className="w-1/4 border-[#DB7038] border-2 rounded-[30px] flex shadow-custom bg-[#DD7135] bg-opacity-[65%] flex-col">
          <p className="mb-8 text-center text-[40px] text-white">Регистрация</p>
          {error && <p className="text-red-500 text-center">{error}</p>}
          <form onSubmit={handleSubmit} className="flex flex-col gap-6">
            <input
                type="text"
                name="first_name"
                value={formData.first_name}
                onChange={handleInputChange}
                className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none"
                placeholder="Имя"
                required
            />
            <input
                type="email"
                name="email"
                value={formData.email}
                onChange={handleInputChange}
                className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none"
                placeholder="Почта"
                required
            />
            <input
                type="password"
                name="password"
                value={formData.password}
                onChange={handleInputChange}
                className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none"
                placeholder="Пароль"
                required
            />
            <input
                type="password"
                name="confirm_password"
                value={formData.confirm_password}
                onChange={handleInputChange}
                className="bg-transparent border-b-2 border-[#DB7038] px-2 text-[20px] focus:outline-none"
                placeholder="Подтвердите пароль"
                required
            />
            <button
                type="submit"
                className="bg-[#DB7038] text-white py-2 rounded-[10px] text-[20px]"
            >
              Регистрация
            </button>
          </form>
          <p
              className="mt-2 text-center text-[14px] text-white"
              onClick={openLogin}
          >
            Уже зарегистрированы? Вход
          </p>
        </div>
      </div>
  );
}
