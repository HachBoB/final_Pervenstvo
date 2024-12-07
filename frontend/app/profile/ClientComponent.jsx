'use client'
import React, { useState } from 'react';
import Image from 'next/image';

const ImageUpload = () => {
    const [selectedImage, setSelectedImage] = useState(null);
    const [error, setError] = useState('');

    const handleImageChange = (event) => {
        const file = event.target.files[0];

        if (file) {
            const fileType = file.type.split('/')[0];
            const fileSize = file.size / 1024 / 1024; // размер в МБ

            // Проверка типа файла и размера
            if (fileType !== 'image' || fileSize > 5) {
                setError('Пожалуйста, загрузите изображение размером до 5 МБ.');
                setSelectedImage(null);
                return;
            }

            const reader = new FileReader();
            reader.onloadend = () => {
                setSelectedImage(reader.result);
                setError('');
            };
            reader.readAsDataURL(file);
        }
    };

    const handleRemoveImage = () => {
        setSelectedImage(null);
    };

    return (
        <div className="flex flex-col items-center">
            <label className="relative border-[#DB7038] border-2 shadow-custom rounded-full justify-center items-center flex bg-[#444444]">
                {selectedImage ? (
                    <div className="">
                        <img src={selectedImage} alt="Uploaded" className="w-[280px] h-[280px] rounded-full" />
                        <button
                            onClick={handleRemoveImage}
                            className="absolute top-2 right-2 bg-red-500 text-white rounded-full p-1 hover:bg-red-600"
                        >
                            ×
                        </button>
                    </div>
                ) : (
                    <Image src="/avatainput.png" alt="Upload" width={18} height={18} />
                )}
                <input
                    type="file"
                    accept="image/*"
                    onChange={handleImageChange}
                    className="hidden"
                />
            </label>
            {error && <p className="mt-2 text-red-500">{error}</p>}
        </div>
    );
};

export default ImageUpload;