--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: events_db; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE events_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE events_db OWNER TO "user";

\connect events_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO "user";

--
-- Name: events; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.events (
    id uuid NOT NULL,
    name character varying NOT NULL,
    location character varying,
    start_date date NOT NULL,
    end_date date,
    discipline character varying,
    quantity character varying,
    format character varying,
    district_id uuid,
    report_path character varying,
    status_id uuid,
    region character varying,
    owner_id uuid
);


ALTER TABLE public.events OWNER TO "user";

--
-- Name: statuses; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.statuses (
    id uuid NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.statuses OWNER TO "user";

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.alembic_version (version_num) FROM stdin;
745dc4f4e141
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.events (id, name, location, start_date, end_date, discipline, quantity, format, district_id, report_path, status_id, region, owner_id) FROM stdin;
19ee19f4-59cf-4cc4-adec-2c7691bc40c1	«Международный день интернета»	Ставрополь	2024-10-19	2024-10-20				\N	\N	\N	\N	\N
56f2e9fb-1cf4-4b40-82e5-aa3dbb757b11	«Международный день интернета»	Пермский край	2024-09-13	2024-09-15	Программирование	Все	Оффлайн	\N	\N	\N	\N	\N
bca421f1-3f32-42b3-9c5e-86aeece26f68	«Международный день интернета»	Пермь	2024-09-12	2024-09-16				\N	\N	\N	\N	\N
7479d901-81b9-4251-ac37-540e03b75704	«Международный день интернета»	Калуга	2024-08-27	2024-08-31	Программирование продуктовое			\N	\N	\N	\N	\N
bcd07825-b47e-4c60-9637-f9e39751930b	«Международный день интернета»	Калуга	2024-08-27	2024-08-31	Программирование	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
37998891-166b-4472-a209-c84bc841ddc9	«Международный день интернета»	Оренбургская область	2024-06-26	2024-06-30	Программирование робототехники	Все	Онлайн\\Оффлайн	\N	\N	\N	\N	\N
8b9b78ef-4b77-4b91-925c-fd6c0d2cf623	«Международный день интернета»	Иннополис	2024-06-02	2024-06-04	Программирование	Студенты	Офлайн	\N	\N	\N	\N	\N
768cc347-f823-46f4-8925-bd5f4d17b361	«Международный день интернета»	Россия	2024-05-29	2024-06-02	Программирование продуктовое, Программирование алгоритмическое	от 16	Оффлайн	\N	\N	\N	\N	\N
bb26b336-f0b4-4378-9dbf-1f0caf57a56f	«Международный день интернета»	Россия	2024-04-21	2024-04-21	программирование алгоритмическое	Мужчины	Оффлайн	\N	\N	\N	\N	\N
2e99ca61-ed63-41d2-bdc4-a680e16b34d2	«Международный день интернета»	РЭУ им. Г.В. Плеханова	2024-04-20	2024-04-22				\N	\N	\N	\N	\N
f337fe81-c349-4f9d-8e6c-0a5f7cd9c4f7	«Международный день интернета»	Чеченская Республика	2024-04-19	2024-04-22	программироваание продуктовое	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
f2f8a9e1-0294-439c-a028-e453335196d6	«Международный день интернета»	Чеченская Республика	2024-04-11	2024-04-13	Программирование алгоритмическое	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
512cba68-2d79-401c-b1d5-d551b5633ce4	«Международный день интернета»	Россия	2024-03-23	2024-03-24	Программирование продуктовое	от 16	Онлайн	\N	\N	\N	\N	\N
6a3b5920-3ceb-42d7-afa1-1c78461bbcbf	«Международный день интернета»	Чеченская Республика	2024-02-16	2024-02-19	Программирование	18-25	Оффлайн	\N	\N	\N	\N	\N
1d97a258-aa7c-4b5b-8531-6ecec582b7cf	«Международный день интернета»	Республика Татарстан	2024-02-15	2024-03-04	Программирование	Все	Оффлайн	\N	\N	\N	\N	\N
b52b5f84-3ab6-4ab0-90e8-c0811baf1808	«Международный день интернета»	Россия	2024-01-28	2024-01-28	программирование алгоритмическое	Юниоры (17-25)	Онлайн	\N	\N	\N	\N	\N
0a7333c0-558a-408a-b183-ebf52e429111	«Международный день интернета»	По месту нахождения	2024-12-06	\N	Программирование	Мужчины	\N	\N	\N	\N	\N	\N
888ab352-8a9d-490d-80ce-45edf3584918	string	string	2024-12-07	2024-12-07	string	string	string	6b1e7440-d311-47f7-83b4-6d0c20295b78	\N	d275b98e-8050-439d-8a67-795785d9df62	string	40b8b069-2be6-4ff7-a94c-e78f814cc63f
8ca2340f-bcab-425b-931a-87c0b3db8f7f	string	string	2024-12-07	2024-12-07	string	string	string	a17c6494-de2a-4edb-a4db-3bcf95f832f3	\N	e1aad360-47ed-4205-9e03-19f53f893017	string	91a07f77-0691-43ed-be0c-5cae5a33b77c
5ebdca52-1b45-42f1-97fc-35edc9262f54	string	string	2024-12-07	2024-12-07	string	string	string	a17c6494-de2a-4edb-a4db-3bcf95f832f3	\N	ca1e1587-ab9b-4e20-9813-64742ecec488	string	91a07f77-0691-43ed-be0c-5cae5a33b77c
7b85a678-8381-4d85-b860-f0d956cf3b72	string	string	2024-12-07	2024-12-07	string	string	string	6b1e7440-d311-47f7-83b4-6d0c20295b78	\N	e1aad360-47ed-4205-9e03-19f53f893017	string	\N
9a404a8f-e12e-458d-975f-9e7722861245	string	string	2024-12-07	2024-12-07	string	string	string	6b1e7440-d311-47f7-83b4-6d0c20295b78	\N	e1aad360-47ed-4205-9e03-19f53f893017	string	91a07f77-0691-43ed-be0c-5cae5a33b77c
8816fccd-c4da-4ce8-991d-67048c67f6e6	string	string	2024-12-07	2024-12-07	string	string	string	a17c6494-de2a-4edb-a4db-3bcf95f832f3	\N	e1aad360-47ed-4205-9e03-19f53f893017	string	91a07f77-0691-43ed-be0c-5cae5a33b77c
8b750b69-88ce-4e53-a81a-9b716437cda0	Международный фестиваль  по спортивному программированию	Байкальск	2024-11-29	2024-12-01				\N	\N	\N	\N	\N
ccb19741-085b-4a61-8f03-a24242862ea9	Окружной этап Первенства и Чемпионата по спортивному программированию	\N	2024-11-22	2024-11-24				\N	\N	\N	\N	\N
074e222e-dbd9-4216-83b4-651c26ea1b95	"Всероссийские соревнования среди студентов по спортивному программированию  «Кубок будущего»"	Россия	2024-11-01	2024-11-30	Программирование	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
078c66a5-458a-4c58-9233-4cab49af00dc	Всероссийские соревнования  по спортивному программированию «МФТИ RuCode»	Ставрополь	2024-10-19	2024-10-20				\N	\N	\N	\N	\N
4f9ef0c3-c8d5-46ea-be7e-b72dbcf7201f	Всероссийские соревнования  по спортивному программированию, Пермь	Пермский край	2024-09-13	2024-09-15	Программирование	Все	Оффлайн	\N	\N	\N	\N	\N
749e7f79-7020-45a3-a796-b3cc876fe5a1	Всероссийские соревнования  по спортивному программированию беспилотных авиационных систем «Парма-БАС»	Пермь	2024-09-12	2024-09-16				\N	\N	\N	\N	\N
8ef401f8-fd2a-435d-9347-19c8b62c661d	Всероссийские соревнования  по спортивному программированию (дисциплина -программирование продуктовое)	Калуга	2024-08-27	2024-08-31	Программирование продуктовое			\N	\N	\N	\N	\N
23b381b9-44ff-4cbe-b3d6-9b76986f592d	Всероссийские соревнования  по спортивному программированию среди студентов 	Калуга	2024-08-27	2024-08-31	Программирование	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
c91341e6-580e-4504-8c51-7ab4da92ec9f	Всероссийские соревнования по спортивному программированию «Российская робототехническая олимпиада» 	Оренбургская область	2024-06-26	2024-06-30	Программирование робототехники	Все	Онлайн\\Оффлайн	\N	\N	\N	\N	\N
eaf9bc96-756b-422a-aca2-b6137b0a7cff	Международный фестиваль по спортивному программированию «Код Образования»	Иннополис	2024-06-02	2024-06-04	Программирование	Студенты	Офлайн	\N	\N	\N	\N	\N
8d995590-acb9-4b01-ac75-fc4ce538910a	Международный фестиваль  по спортивному программированию  «Код Мира»	Россия	2024-05-29	2024-06-02	Программирование продуктовое, Программирование алгоритмическое	от 16	Оффлайн	\N	\N	\N	\N	\N
677fa548-de7f-4174-bdba-6ac52c41a860	Кубок России (финал)	Россия	2024-04-21	2024-04-21	программирование алгоритмическое	Мужчины	Оффлайн	\N	\N	\N	\N	\N
c7427bcf-9704-410b-845d-40dbf5decbc8	Кубок России  по спортивному программированию (финал)	РЭУ им. Г.В. Плеханова	2024-04-20	2024-04-22				\N	\N	\N	\N	\N
4710e05f-f9a2-46db-a560-16500ec27e78	"Всероссийские соревнования среди студентов по спортивному программированию  «Код образования»"	Чеченская Республика	2024-04-19	2024-04-22	программироваание продуктовое	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
65dce5e5-4e64-4e83-8082-13ea63a9b829	"Всероссийские соревнования  по спортивному программированию  среди студентов, посвященные  Дню Космонавтики"	Чеченская Республика	2024-04-11	2024-04-13	Программирование алгоритмическое	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
5dc02757-e42d-4bcd-b2eb-02502a13cc9b	"Всероссийские соревнования  по спортивному программированию"	Россия	2024-03-23	2024-03-24	Программирование продуктовое	от 16	Онлайн	\N	\N	\N	\N	\N
50658d99-6fff-41d0-9815-2a611ba86d40	"Спортивный фестиваль  ""Техноспорт Первых"""	Чеченская Республика	2024-02-16	2024-02-19	Программирование	18-25	Оффлайн	\N	\N	\N	\N	\N
a8d42745-9d8f-4d53-9b0b-8abe89cffbb0	Международные соревнования "Игры будущего"	Республика Татарстан	2024-02-15	2024-03-04	Программирование	Все	Оффлайн	\N	\N	\N	\N	\N
c4fe640c-653a-44f4-9025-f6eee26ee849	Всероссийские соревнования  по спортивному программированию  "Игры будущего. Отборочный раунд"	Россия	2024-01-28	2024-01-28	программирование алгоритмическое	Юниоры (17-25)	Онлайн	\N	\N	\N	\N	\N
334f2714-19dc-464d-86b0-807316f21687	Всероссийские соревнования по спортивному программированию посвященных                                              	По месту нахождения	2024-12-06	\N	Программирование	Мужчины	\N	\N	\N	\N	\N	\N
84af3956-5f8d-4ddf-875a-babe8da8bc2c	«Международный день интернета»	Байкальск	2024-11-29	2024-12-01				\N	\N	\N	\N	\N
43896b16-0c2c-4c90-9b78-294743488331	«Международный день интернета»	\N	2024-11-22	2024-11-24				\N	\N	\N	\N	\N
a70d2a72-2999-450f-990c-b5011ff616ea	«Международный день интернета»	Россия	2024-11-01	2024-11-30	Программирование	Юниоры (17-25)	Оффлайн	\N	\N	\N	\N	\N
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.statuses (id, name) FROM stdin;
e1aad360-47ed-4205-9e03-19f53f893017	В рассмотрение
d275b98e-8050-439d-8a67-795785d9df62	Опубликовано
ca1e1587-ab9b-4e20-9813-64742ecec488	Отклонено
\.


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: statuses statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_name_key UNIQUE (name);


--
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);


--
-- Name: events events_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.statuses(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

