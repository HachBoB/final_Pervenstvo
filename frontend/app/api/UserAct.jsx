import {log} from "next/dist/server/typescript/utils";

export async function getUserData(token) {
    const res = await fetch(`https://mihest.ru/api/AccService/Accounts/Me`, {
        headers: {
            Authorization: `Bearer ${token}`,
        },
    });

    if (!res.ok) {
        throw new Error("Не удалось загрузить данные пользователя");
    }

    return res.json();
}

export async function updateUserData(token, userData) {
    const res = await fetch(`https://mihest.ru/api/AccService/Accounts/Update`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
            accept:"application/json"
        },
        body: JSON.stringify(userData),
    });

    if (!res.ok) {
        const error = await res.json();
        console.log(error);
        throw new Error(error.message || "Не удалось обновить данные пользователя");

    }

    return res.json();
}
