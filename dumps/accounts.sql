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
-- Name: account_db; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE account_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE account_db OWNER TO "user";

\connect account_db

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
-- Name: confirm_session; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.confirm_session (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.confirm_session OWNER TO "user";

--
-- Name: districts; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.districts (
    id uuid NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.districts OWNER TO "user";

--
-- Name: refresh_session; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.refresh_session (
    refresh_token uuid NOT NULL,
    access_token character varying NOT NULL,
    expires_in integer NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.refresh_session OWNER TO "user";

--
-- Name: reset_session; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.reset_session (
    id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.reset_session OWNER TO "user";

--
-- Name: roles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.roles OWNER TO "user";

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO "user";

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email character varying NOT NULL,
    hashed_password character varying(1024) NOT NULL,
    is_verify boolean NOT NULL,
    is_deleted boolean NOT NULL,
    number bigint,
    first_name character varying NOT NULL,
    last_name character varying,
    region character varying,
    is_man boolean,
    role_id integer NOT NULL,
    patronymic character varying,
    district_id uuid
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.alembic_version (version_num) FROM stdin;
ebf6fb807a18
\.


--
-- Data for Name: confirm_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.confirm_session (id, user_id, created_at) FROM stdin;
b07a8620-1566-425a-b59f-992cc7114ece	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 04:51:25.645834+04
30379fd5-13b3-4678-b7b5-2ad69e5c0293	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 04:52:28.426335+04
1b702e61-de23-4a92-a8df-49fc059d6e85	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 04:54:43.329337+04
f7a3596f-b4bb-43bf-b5b9-3e0d3d5a212b	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 04:55:41.433933+04
\.


--
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.districts (id, name) FROM stdin;
b327972e-e5b4-40b5-a29f-ca7940838e05	Центральный федеральный округ
1c243cd3-e44c-4345-8f71-28b3c48be71b	Южный федеральный округ
1459db71-c745-48df-8663-7a61abbedc6c	Северо-западный федеральный округ
6bf0c447-2b69-41a1-81e5-750b462270cf	Дальневосточный федеральный округ
632a47b7-8edb-4ca7-918a-e9f2a0fc29ff	Сибирский федеральный округ
36323e99-62df-420d-907f-7cf7be895c15	Уральский федеральный округ
a17c6494-de2a-4edb-a4db-3bcf95f832f3	Приволжский федеральный округ
80768e35-655d-4780-93e1-52246a893926	Северо-Кавказский федеральный округ
6b1e7440-d311-47f7-83b4-6d0c20295b78	Новые регионы
\.


--
-- Data for Name: refresh_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.refresh_session (refresh_token, access_token, expires_in, user_id, created_at) FROM stdin;
8c9ff74f-11d8-48dd-ae64-2189346da4dc	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiVXNlciIsImlzX2RlbGV0ZWQiOmZhbHNlLCJleHAiOjE3MzM1MTk5MDB9.g5Q3KT9OrFS_NIUQLXQni3c7Bzfu9P9jy8DWYn1tWbKs2mhs65LHYuzGF2FszmSwf5cMFb4xBsuwPbT3VJPFoOVLAFlBNn_QYaQRsYRF5EHJOfxVzr-5tMoJPmv9mCw3AtL1A5EVvlxp0_sJewOaiK9AdfSFdPQnQPX252ADhnVJsxQAzauIriK65Ur8AVT0pSXOt3LjChf3Zh2TDumMbZHJXMheVDdiFBPR2U82bZ3YZO-kjIkz_V7I6JOn1Xpi-Wt_D17cXRbtCUloOGT3iSVn3qLScsiOjaMMqgqwYuHRwJMXaO7YZepYBPNtLR3RshsPn6bXyEeOLpE-HTq2qA	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:03:20.062403+04
b404842f-c65d-4828-9ba0-3848e2883c89	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiVXNlciIsImlzX2RlbGV0ZWQiOmZhbHNlLCJleHAiOjE3MzM1MjAxOTB9.Vc9WhiP9txM1bsHsNcu-ODAyEEVfCp5Gyr1dG7yhyv4vlx_TrGEOUOmfX2BVghGhEhPJAdOibMtvHkrCLRDsdS_WrecJjNXxj0UxWL2O4CgkUE9IbvuF210vAkeTlCgp_vmsYHPyZTMQuRhOPWLCpzdxK8g4HiaUwq8BFqW71DNc9HXy65Opr6Lm6SO_F9si87TIBtlZdsKrKS9sAbUn2e-__CTw2kUBj7s3YR-Ev83VoTdAlekeGIwmEpGjqu59wtpLvxC0HbfllyeibReLCCYhh9JVZVD3mTD1cIASwzqhHLXA5-ycpmiSXji1od6Ia3Ng-sRR-1wzFAxEgJob6g	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:08:10.232261+04
340684e8-aa03-43d8-995e-375418d8aaed	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzZGEzZDEwYy1iNDJmLTQ3YWItODVjYi1lNTM0NDBiN2JhYzMiLCJyb2xlIjoiVXNlciIsImlzX2RlbGV0ZWQiOmZhbHNlLCJleHAiOjE3MzM1MjAyMDV9.Dsjm-sJh-eOmijJJK2kRUfRG0VQ_DEiGTZm1NZIgGETJsTHqjU1HhZ3xZwx6cJibMiCbdv2WigXwlIYxeXCb6ZhUmvvu-ccGJKzQ6UeNqGRxXUgRMHqRGaBJ-f9b7IKyOYF0ez4e1u9ILDMmEBOkDM8YqJZOvdtVsTu5UIq7uj0gLQR9tTgqcznlJ4_21_GoKbu3Wm8QMgie1Dh3pirDMcaz-E-kl-40AR88WV0gut_RhY4ASXs1D6Crh9WXjABBFeXjsltwcBMedy2WNGMDhWzmmC8LHNFp18LfSXXW3S101BdXtos5QhxDEaJPFLa9To34WGzvw95spT2H6pqmHw	2592000	3da3d10c-b42f-47ab-85cb-e53440b7bac3	2024-12-07 01:08:25.726463+04
5165fd0b-4a98-4f47-b36f-b2175cdf0e96	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiVXNlciIsImlzX2RlbGV0ZWQiOmZhbHNlLCJleHAiOjE3MzM1MjAyNDl9.fm6whXpnwmQuBrFnRLSRH-tnZK1OQyZ71zEKHb1cQb-YhgUBIFevMjo9lDF40OxGMK0SSOMinIZQghcBYDsOzeC8HDWl965DKEPjkkbAgeYygPP8raqYNYKC-dcbxx87QqonjeoNFN_tO0b0f6HIxi_RNXb49sPrm6e2dUF1K2hwBpAro8S1b1-jJbW38HwcPfLkqDn4zg_JoFkCsn12kW6_W2-BGoKZCbrgCa_v1QDdmhMVTCwrVBBZMyc9qZ-GkAtBz4mXK8ZYNjZPapPQlTfmbgRLDazKFAMQ6PrdcbEKnTtQUo-4JnziGgRYvSr8blYHFMImF9fuKWmRv338hA	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:08:54.770674+04
d86d9322-0f45-48b1-baf3-b0f58bffd117	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiVXNlciIsImlzX2RlbGV0ZWQiOmZhbHNlLCJleHAiOjE3MzM1MjAyNzB9.NVBTpdmDHAyE0sM0_1H67wHtHpbY4EdzfHLtVpcOP8V24a8tzcxn5LuFE8MxDa9A-0-pI8fTs536WUqZRQR8uVMWckgvxcl1k6cLHqkh9tsTmkENxWt2cIL4KtTnq-8TPvt-U_lUKkBKKk4xugl3Bf7-JxUExvo7XWCCOMkNSXSjdqQHwvCvgVQIo1KAmb9f4imLOIIJU-jjHVpFAaII4WOTd8wJpTzNQfMhScLhsgT4DtZfqBqBQ2NHQ9RV6KinjH6VGeSbvDg6zNio-NmGAMlOcH3eVHsZy2lVQ8QQdibovbSBfkW9vvdZ5v2KNm6vhQU7nIF6m2aaQ3Xnao494w	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:09:30.40333+04
700a5a7d-c84e-44cf-882a-105e7fa968c2	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTIwODk2fQ.JzYPzMDIi0HhyjE_xUAlcvPzgX_hU8ME0gQWrO5T8ikP9wFMzk6KKdWFJz3SYVkZcL85SQK_kZQMaTDsGlUnfrCDGqhWVQLA5CSU-HOK0HgDGaN_xInvYpq3iNVkhkCTnbW7GNutWAJxy0fYAj3bonUgeYvooGKVpyhyHRsvS3Qg81d-CpfBYJFzibuc_hDnsIkLtlYuJzaB50T1FxHmcbJYnRhVd7CccU1LSk2bPe-wMKW7Y_NcOAPMePR0eV2xJqUDQgqJGFl-1FVdpewIs-BskT8f_koB8ZptC1Jbf3ptiRUt4Xr7BhPl9DZwH4_8PA0ZJzT5SMbIIB6mDzxyIQ	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:19:56.444491+04
18460b54-47f0-4723-8f7e-877e5c29fc3f	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTIxMDEzfQ.PstYNTX3pD0xe0dXiT-YYECM9hz2bfw2OktMt_Ux2Mg1jrhvItU5AGkkKQOvormbaw54JxDwWj1-_bLD1bpiXqVddZvp40S_5ta9QtfjMJOcaFoIfjCoZPchJqhbMqatPXZ6swiiAMLRXLHgE3d_rEeRycbYmR0N4RhV3AzOiiNDagGVO8mD8Y9MQpc6mrrXSFvCIvngQAArDpUKYLwt-OkGaZSIQatSQbVPanQPHNsQE0StHRqaA5u_YAp4YlrlE_3KrMBexN_BcLxrR6PqZtfA6ny1m1S9CNxBbINehD_gkJCKmgdJJuzlbiMoNl3tHTDHF4K1BL8yxuzc6vUwFA	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:21:53.161633+04
fafcc32b-7e76-46c4-b5bc-d70976fc0d03	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTIxMTc3fQ.ajrWbEjEt3YiROL4s2qgfcaj0TXMYWnB1yKgD1NeFamPzj_kldHV8H4jZjSDtTNFpgjDo9r3Ik_ztpfeQQDL0sP--KQAnJEAUk-sTZ3cIP08tPPSYz2KGGwqeUMnR2B7nfBXB4rWcN-Nd9q5cvLYvefBlPW1WfFiDzJMA4HL5hSvP4WVyHuzu7nx4Ae5yW3zVB-jO4FnjA7vZ-aPcpyjAhuRyDpkhBq9qir7tGIMoSFXuWPM5WoP-3mKqsaJHvSEXomgmjWbmTvJ4RKIUlcW81fRtZfcJ7dlmDUCfh5uMucbaqGLtJPT5rABUV4ppcHaE8x0dR-k3JtYtECKT7CbnA	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:24:37.328933+04
7a952a61-3dcd-4345-8946-4836294c12e9	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTIyMDYzfQ.Sx5rplEn5T-pnVLRXu3e9dpBCfK4cn52yNICRxCJ-NLecGKezV8hZr8sg38x-i2vJJ0OHGe2CspZAcSRMaokUq_q8JVUIJDQvvD-PsvYeqclJ7j8_khntAWOS2o30lrXnvzMflG9Mp3V0m_mipX9T0-V2M1Kg-B6jiS4BDDzlBEHVVeornjYCOtKhhIeONzv85F8wzvZ1JVDbqeswghmg01gio9bW_neWXjNq-lMVEMSWSGHaNO8Z8sdMO6jBrvfyD2SRdVYD9bcCASlFGLmEqNE_SUK0xLoi_bKpxRWj0zBumcHCzwd7q39TT9SD_xF8GIaTYcOMkw460WjGvu1Og	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 01:39:23.713145+04
aa84348e-1631-4e15-9b2a-62f082671373	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTMyNjM5fQ.N7xv8jmFR3S2sqS5oHY5CHgmLpsrA2X9-Yzzp5gXE1v6eI_XM77yakoeWLcX-YUKygn3PdwcbEq1Lfz65oYdQi58wFJ-k8mdVpUem_bF367LC2-buaBvkTYyvfuX3Ejz01Puy1C_3aK-KXg-dlxY2VUybbB0y8BVH5eI2E1rYQSG-Mtfl4KD5IbAuVimphXr4EBKuctH_UIIgrb3pAgRZERY5Ao8iBSISfbuw_Dj1FJqtdMI43N0kgmJb7Lr-zRxTyYxf1ySph9_A6_5GnXNDlc0lZgeCOF5pQqunT-NcIoPsnDJbG8071Muvip7qRTG2K69as6LmNehSt17VXzYFw	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 04:35:39.677113+04
f085e65d-1c6c-493a-8cb4-30b7f5ae68b1	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTMyNjg0fQ.D-4HM9Z_viRtMkDU_O0Vv_vcIQR2TbPHaApKIx0SUYrbEdOIiEN3dzi_y-9Rbw7nxfqreCKQSvXClqwxO78z-WXeT3XWetSmhfebs_0BAPlyBc3COsqzFfQgw0g38YFdtT-RcYfeCZ--jTlKh_7mnMd2vO1L_97TqsAS8omjjVnpyEbLQ46hd_QtIQyINd1tOY1yn9ddcttR4G3kNfor1S_-ZXNjMGw5ekt25h_0ijEqU5cG49FsTeCirDz5JZL2uO-P6jK9-wY-Q4sYBEptHrqKEADU6JneguT5kkQFKjj8HAvU57Rc11lB27XEvrAqmZaVM7K1H4jmYzrHa8Lgcw	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 04:36:24.439905+04
cf850b82-dbf7-4a49-8dc9-4f39967df360	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTMzNDYwfQ.eWlGPPa0mYkPJf2zRLI1QSzfZkuXKp6TpR2_mfys3axVd_6mTonjasU-FRqNX_zZzMrQxXrenSlLHJfrI0w0gleAHwGA0Hv7Npclt9hazNXUM6Pb2bMb3clZQaA0rGsWTKdZ8BMTqGdtZXB3BKP_aUMNZXvrpC432WLjyYWRjPMnvM4iypJh-e_RAPdhtBBJoTyaF-65PP0XvWaN0IWWGa6avudUzE5EtyBhZvZtex0NWEnGPkA2T1KJJbmGUjBwmgbUwShlgJ6IJvNqwZohNcjCJ9esFh9g3JOpuXGcue2nSSJbtFH1Yh7BVNHpnWmgJsZt9nzcMHZOsEDVuZ3wKQ	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 04:49:20.060619+04
74d3c86a-86b1-4f71-aff1-1118f6a737b0	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTM1MjMxfQ.KX5cmmfc2Za00GzWUezbjFGMonE1DGr7z4yTvg_JaNKw5GLMuGMES0npJHDBTjXBpEGuWcait7_pJJm9RefE5dDa44a90U3bnB_I0kuShY81gIasayW2qVb047_TN_9jUZKNJhMocmtmRkHlOxyAKQw8B9rBHtIOduerOqwoYkH-sevnE7BmwniO4iHkZrJnzJAZMWIQd_4t6ycMbxKQriF4-JL04JNr6d0GQT-Lpv0L0bJ7s8zAi4hTu75DKVeyjyMc3ZYK026hY8Lz1PnAwiOuoMa3kj8a22m_-O0EyLQGDMiBit9-HvLVOsiOFG2cPTM_oFIGIVXafHPiXBxuBA	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 05:18:51.052249+04
a03112c7-702b-41c7-86da-b836227fac34	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTM1NDc5fQ.JfHvjk878Zvxqgfu-HN-l9QxRmnW4zttxSGkrW5Z1SyJzjV8tD_gcm8LwHFpx6ZKPwrtTZyrjCAKJh0nSBdlE4ngpcZA9KNq3stTj0Z3WNU7f1kF3wZOtYR4bmvKRutNdPhVnR8ccHtiseJAOtIrUCzGBwVMybHu0ZTC0ARb64g5J8Wz3azHCLCSNOKAt4KIeqYSrS--CCJs568EHazatqZ9t0d3Fwk6i8Agv_zp90xJoja9kYsZSCGegK8CJR_e26pwcU0pq65l2_bVcJkleAhxiDV3b22bTq-9ysfcUE2BPW9-FtpLsgZIzv-nGwcH5d5TAiFpK_OpspLvuvyRmg	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 05:22:58.830614+04
52f4896a-662e-4f1b-8e73-efd9e14013a7	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTM1NTMxfQ.HNvnQb0yAtaehadirY4t1DZs0iQWQUAottpz-BCcSz-5bBVQQRFP_28gDP_YRTfAbGFxJltn7trvxhvvdo58HGYoduos9UZ98JFez4wyQ2JUndt2PBIAroqZWeBaus-TFqi92-qe6lCfjivH-ErsGkdGWXWaI7RXA0Z97yrFPoHBZgflxiG-hOwbnucnqAfRmRud5FoOS6NQHRsKs6aNRGyAoazaCl8lg4aT2AhZXOCAISCBwhJj_LFNBZYPXeq69N3zooP-ksTGz8PIgajlqM3ArpgoFR5h7C7ILuNSOoZTT6xNBH8Ag5XwqPHyrI4k8PJoTZnlR8qiAbnvyLa6Tg	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 05:23:51.099341+04
d167c40c-952c-4400-b680-27e1ea956c77	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0MGI4YjA2OS0yYmU2LTRmZjctYTk0Yy1lNzhmODE0Y2M2M2YiLCJyb2xlIjoiQWRtaW4iLCJpc19kZWxldGVkIjpmYWxzZSwiZXhwIjoxNzMzNTM4NTMzfQ.Gbkdg_dyT-pTdXwyIe9UdHHv_cBK1-IuZK3EiOTPHz4RolLUZK2RJdfBfTAr8t4zSdpndAGRaVUEd5exHiOHcgyqdNffP_mWJnw96xYVrTz-44xJNLD_xHnoAie2ydngCV44KDITV4Lih6T5Z7o830yr55EpIl2us0ztVB9ndZx8Wp19UG9YZz4G03O5MXXx83qfhge31Cr3GaTmvL6o3OsUEGtiIBmsIHl-Qzs-or0C3L6Sr-mszuUdQIxstbm48KRFtjQXnd1SumrKrrmVZo2JEGhJtmDy6VwKzkgTRancCABeg9YDmUYrh4CbDNedvuTaqPpm63w8e6hhEJd5xA	2592000	40b8b069-2be6-4ff7-a94c-e78f814cc63f	2024-12-07 06:13:53.58925+04
\.


--
-- Data for Name: reset_session; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.reset_session (id, created_at, user_id) FROM stdin;
c1fbe22f-c0e5-4e29-aa92-b7bbebb672e6	2024-12-07 02:12:05.801834+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
6aac3de7-b951-4175-9961-8ff723d87396	2024-12-07 02:14:14.946639+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
beec6a2d-d879-423e-8763-3ff85cd5d3d5	2024-12-07 02:14:39.268242+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
a1f221e1-e502-41fb-af87-218c95d24ea0	2024-12-07 02:15:44.562931+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
c82df3d0-fdce-431e-9823-636ea3839e4b	2024-12-07 02:36:13.096594+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
f01ebe59-0889-47cf-90a9-c0b08d877790	2024-12-07 02:37:06.999778+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
28dad0b7-8671-449e-8284-2938a6398cf6	2024-12-07 02:41:48.953811+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
312e4325-aa5b-4d4a-b171-ca041944e867	2024-12-07 02:43:17.178281+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
a34d75ed-c0fb-4bee-98dd-deed550d1d82	2024-12-07 02:44:45.27907+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
951cac44-0621-49b2-8e0b-9e2b0728077c	2024-12-07 02:45:14.534384+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
f51ddee8-0226-4700-a125-8b912cad0f85	2024-12-07 02:51:41.904624+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
0d77b384-a9ba-4720-b192-4331a2d5c1d5	2024-12-07 02:52:54.221363+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
5a297e31-6b51-4bd8-8186-4a5bff472090	2024-12-07 02:55:20.650075+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
9ccf1f15-8f4d-4c46-8bf5-9f5e57e70bdb	2024-12-07 02:56:00.950725+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
d1078fc2-130a-405c-a456-dee6a832295f	2024-12-07 02:59:12.999595+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
96786d27-bb05-4552-8e3f-f0d1c72e25a4	2024-12-07 03:00:40.531812+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
73a66b72-71e3-456d-ae3e-2c88db2321d3	2024-12-07 04:10:49.436648+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
907378c6-0084-4244-a14e-1c1a0514bc2b	2024-12-07 04:13:55.556013+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
9e7e89a9-fac0-487e-bc9a-cf4c94b6ef83	2024-12-07 04:14:42.43774+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
faba92f1-ff9c-404e-b532-a4c457a4ff0f	2024-12-07 04:16:09.394192+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
9ca57fa2-2d34-4aa8-972c-d6f62a863e5d	2024-12-07 04:16:57.969314+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
ca6a9d62-3964-499e-badf-581b8ae3262f	2024-12-07 04:17:36.086213+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
977e93d1-3c41-4576-aa9c-bce5558c4419	2024-12-07 04:18:03.070683+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
4417c2e2-6220-40ca-9b2c-f46485df98af	2024-12-07 04:21:33.995233+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
c34fabd9-de2b-4e80-bbd3-a4e5f5a30b4f	2024-12-07 04:24:36.032878+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
52b07c17-0683-46a6-b51f-25087c3e4be6	2024-12-07 04:25:38.194983+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
43c00291-167b-41a3-b300-ab2df073fcb8	2024-12-07 04:27:13.773906+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
8ce3a32b-7bbb-40e0-af42-7106d6001cf3	2024-12-07 04:28:55.965316+04	40b8b069-2be6-4ff7-a94c-e78f814cc63f
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.roles (id, name) FROM stdin;
1	User
2	Admin
3	Super admin
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, email, hashed_password, is_verify, is_deleted, number, first_name, last_name, region, is_man, role_id, patronymic, district_id) FROM stdin;
3da3d10c-b42f-47ab-85cb-e53440b7bac3	ываы@asd.ru	$2b$12$YDBW6hj2nnX7KFq7r6qBQ.EWbc6OD7yt9tfCzkZY101UMSmQQqeK.	f	f	78888888888	string	string	Федеральный круг	f	1	\N	\N
40b8b069-2be6-4ff7-a94c-e78f814cc63f	admin@admin.com	$2b$12$47byza6xD9e/YaknLwKV.O5eDuznoN01LC6KAAIiXWV1gywHg8QTe	f	f	79999999999	admin	admin	Федеральный круг	t	2	\N	\N
c88b8c47-9468-4665-ba09-27a33b698a95	belgorod@fsp-russia.com	$2b$12$njpACSJnVna5xpV3cVJQn.1h/3gT2f32/Mc3xLA/cUHP295O8yHkO	f	f	\N	Не укзано	\N	Белгородская область	\N	2	\N	b327972e-e5b4-40b5-a29f-ca7940838e05
aa80547c-ff03-4697-a2e1-f7b80f337ec4	bryansk@fsp-russia.com	$2b$12$98kKSRdDI1h/gEqLBeYUaOTw/FDtaDTzONJnupNbp3L0jmzRrHTP6	f	f	\N	Олег	Казаков	Брянская область	\N	2	Дмитриевич	b327972e-e5b4-40b5-a29f-ca7940838e05
e87508e5-b8f3-44c2-9049-499d65b9c176	vladimir@fsp-russia.com	$2b$12$IKtASrOXLy9hvmsc7mEodORApY9ayDgHdEnijErf1UeYXURmS8SvG	f	f	\N	Анастасия	Лисова	Владимирская область	\N	2	Андреевна	b327972e-e5b4-40b5-a29f-ca7940838e05
2f5d08ea-51e6-4f07-ad86-adb816c325d1	voronezh@fsp-russia.com	$2b$12$q/sM9DAHxvPSTEPS2SEpMe/N22Aodz4B/wPaKS25oUMvj3kCtZt5G	f	f	\N	Владимир	Ульянов	Воронежская область	\N	2	\N	b327972e-e5b4-40b5-a29f-ca7940838e05
6d6efe34-6023-431a-9fe0-b2824991eb9b	lvanovo@fsp-russia.com	$2b$12$XqxptN9u2NfBx/jyoSU5IOFjPE7/uovFlbtRL4hUlbTjGayeoZ8Qy	f	f	\N	Сергей	Уралов	Ивановская область	\N	2	Дмитриевич	b327972e-e5b4-40b5-a29f-ca7940838e05
3c976aef-dfbf-4974-81dd-18ce450981bf	kaluga@fsp-russia.com	$2b$12$Drn5vYxMooj69fgQ6VLYmef26IFkYXUcX0wJI4Q2iPpsohaVKZ3x2	f	f	\N	Алексей	Колесников	Калужская область	\N	2	\N	b327972e-e5b4-40b5-a29f-ca7940838e05
29765c1d-c2ad-48e7-a70a-c537c0e8766d	kostroma@fsp-russia.com	$2b$12$Vw5wvAAlSLk6NSYir0Qdf.scloGcMnW37F12pnfRSGLi6jRqxOMoK	f	f	\N	Дмитрий	Диденко	Костромская область	\N	2	Николаевич	b327972e-e5b4-40b5-a29f-ca7940838e05
cac9b392-c666-47e7-91cb-57ed8060b322	kursk@fsp-russia.com	$2b$12$lUBiMfjU9hzXNtLYYoJDyey0PIhVmy7fZgGkLlTsc.OeeaGj8WPNa	f	f	\N	Владимир	Журавлев	Курская область	\N	2	Борисович	b327972e-e5b4-40b5-a29f-ca7940838e05
a70c8d7a-39dc-47d4-a032-0baba8133a3f	lipetsk@fsp-russia.com	$2b$12$DKJ13//5wvO3gbA0zyRor.n/eXd65DR9qv6NwJlIkfRBTe1iNDpIq	f	f	\N	Сапронов	Даниил	Липецкая область	\N	2	\N	b327972e-e5b4-40b5-a29f-ca7940838e05
48e4ce3c-8184-4136-8edc-f998a473286c	moscow-obl@fsp-russia.com	$2b$12$VW8jvXw1tJVlKWjC2BUtbeLtUxKu/8s5T/.uFMHy9OoSaU7Ktw3HK	f	f	\N	Евгений	Анашкин	Московская область	\N	2	Юрьевич	b327972e-e5b4-40b5-a29f-ca7940838e05
8e4c4ce8-3c0f-4cc4-aadf-83f0428995dc	oryol@fsp-russia.com	$2b$12$alzCWFfjuLu7SYYo9NNM/OyWm2.Oxxqz96tJAx9becTRGOPHgG0Q2	f	f	\N	Александр	Семкин	Орловская область	\N	2	Николаевич	b327972e-e5b4-40b5-a29f-ca7940838e05
b785dd25-cd62-4777-a0d6-da4a0a7ffc1b	ryazan@fsp-russia.com	$2b$12$/VnQipfwtM2AbKkN7r4sX.6tPBAiTrnGP2pESppxxXIkdQY5D624.	f	f	\N	Евгения	Халамцева	Рязанская область	\N	2	Милмировна	b327972e-e5b4-40b5-a29f-ca7940838e05
821d4858-13a1-4063-ab3c-34b328a97f9a	smolensk@fsp-russia.com	$2b$12$YdhOuZAZQEfdx3LRkzcFdeM38/ksyJ1o5g.pM2ZOkUc8xoYDFHp62	f	f	\N	Сергей	Образцов	Смоленская область	\N	2	Александрович	b327972e-e5b4-40b5-a29f-ca7940838e05
21c9e5bc-da8f-4318-938d-7fe9d6cf7061	tambov@fsp-russia.com	$2b$12$.hB.sXCOVQDg/gDyq8ya/O9AnQZ2bvxRQk.q3pkC7GTDfdOY66uGC	f	f	\N	Не укзано	\N	Тамбовская область	\N	2	\N	b327972e-e5b4-40b5-a29f-ca7940838e05
0abed6d2-a379-4dbb-8432-9e8bee687d71	tver@fsp-russia.com	$2b$12$Z5/n1Qp3492fHT0pbvNEoO3Z/rHfTPxJywEQIHuTzDvbz3B3LsSkK	f	f	\N	Петр	Пожидаев	Тверская область	\N	2	Вячеславович	b327972e-e5b4-40b5-a29f-ca7940838e05
2ab602c0-8e86-4c8f-9cff-f05db8a893b5	tula@fsp-russia.com	$2b$12$tA7O0vK83drV6psfjKprbuVZ8vWILLXF6ntSgf63i2nEmM4Cryvte	f	f	\N	Алексей	Сычугов	Тульская область	\N	2	Алексеевич	b327972e-e5b4-40b5-a29f-ca7940838e05
f0508793-2d5f-4cde-bb69-b1ed1ce3fbe1	yaroslavl@fsp-russia.com	$2b$12$/zK0Ko6iUJoPBi5naFdXEuOJv4DJsMJM3m1t6DJApu6/.l1miSZG2	f	f	\N	Дмитрий	Чалый	Ярославская область	\N	2	Юрьевич	b327972e-e5b4-40b5-a29f-ca7940838e05
5cb4333f-d106-490c-b70b-93007e0678be	adygea@fsp-russia.com	$2b$12$zQBvZLxnn6usghPYenWaDeIDhx5.0NHzrEVe4zS9v234s4IlaxuHO	f	f	\N	Марат	Алиев	Республика Адыгея	\N	2	Вячеславович	1c243cd3-e44c-4345-8f71-28b3c48be71b
0d21caf6-bc64-42ce-8015-87878678fd4a	kalmykia@fsp-russia.com	$2b$12$luZiBSC2srU7f7wXZJZhF.XsOVwTX1wj4/RFPXPHMPbidyXYzkUpq	f	f	\N	Аркадий	Муниев	Республика Калмыкия	\N	2	Михайлович	1c243cd3-e44c-4345-8f71-28b3c48be71b
577194dd-8cce-481a-804d-152ee3a027e8	krasnodar@fsp-russia.com	$2b$12$o9sPLI1aeoJ11c.5y2zHtOEqTmkyqAY7AB9hfaZ47IXPzhAWvSdXy	f	f	\N	Сергей	Алферов	Краснодарский край	\N	2	Сергеевич	1c243cd3-e44c-4345-8f71-28b3c48be71b
08cd5d14-569a-497f-832f-99ef53425261	astrakhan@fsp-russia.com	$2b$12$hrjVrlW0pvcsUGX3pm7iwO0C0oYPgSuOGW2qzf9l2eZVtoPITzNJO	f	f	\N	Юлия	Асадуллина	Астраханская область	\N	2	Альбертовна	1c243cd3-e44c-4345-8f71-28b3c48be71b
56650dea-73e2-4d2f-a7e0-f8ca0f2333d0	volgograd@fsp-russia.com	$2b$12$YpLKz1A7rfwVhVNXGu7JjOdWVwTWC0aHB./PFmS5L7ZMGzr2KnP7m	f	f	\N	Елена	Попова	Волгоградская область	\N	2	Владимировна	1c243cd3-e44c-4345-8f71-28b3c48be71b
8f8a7eb1-b2fa-4ca6-8116-879f6f47b696	rostov@fsp-russia.com	$2b$12$BbD.LA6f/JIOhb2Gi/T.TeFNU/aIzuyr5KhxzZvYUBIWI4jFh/MwK	f	f	\N	Станислав	Савва	Ростовская область	\N	2	Анатольевич	1c243cd3-e44c-4345-8f71-28b3c48be71b
62948685-8279-46c4-8291-f5f64e111d19	sevastopol@fsp-russia.com	$2b$12$xq3sRh8OPBJveqqa4kS0OOwiSppl1E7DnsftY1MraFoOXEnWM5NSC	f	f	\N	Михаил	Царенко	город Севастополь	\N	2	Геннадьевич	1c243cd3-e44c-4345-8f71-28b3c48be71b
5e17c880-ffe6-4b13-b2ee-71971855c030	crimea@fsp-russia.com	$2b$12$kRTtRaQsCjHhhAiEvUegJuqQuc9ogNZr.wGpZhkJ.nim5Y4UrbYeO	f	f	\N	Сергей	Зырянов	Республика Крым	\N	2	Геннадиевич	1c243cd3-e44c-4345-8f71-28b3c48be71b
d62bed67-277b-49d8-b7dd-45d03631233f	karelia@fsp-russia.com	$2b$12$fHubd3jXxjLCK0BSKG1zTOAqQ/lyyBcxG36..XysgfnHSFWkD8PcS	f	f	\N	Александр	Каширин	Республика Карелия	\N	2	Алексеевич	1459db71-c745-48df-8663-7a61abbedc6c
dac00b76-f24f-4eb3-adff-5cf43c39a4d2	komi@fsp-russia.com	$2b$12$itQZWvAXVuWBqMmFbPoar.MjLAUzb3Py5dhhvhqCAzPr73aC4oceq	f	f	\N	Александр	Некрасов	Республика Коми	\N	2	Николаевич	1459db71-c745-48df-8663-7a61abbedc6c
0b0398ec-2a68-43b2-9b41-81b09e10e2b8	arkhangelsk@fsp-russia.com	$2b$12$aGyA0THF5jqzaJe/km6.6.edqsy1BIXQZR43ThAHs/H6R4AOYQxuW	f	f	\N	Алескандрович	Алексей	Архангельская область	\N	2	Лисьев	1459db71-c745-48df-8663-7a61abbedc6c
3dc79332-0736-404e-a189-b2d4f0ba4ce9	info@fsp-kaliningrad.ru	$2b$12$dnTjYfikXp9UMxeotqTSH.319gHXrgQsltHgskPdAoO30bNjIiW0q	f	f	\N	Иван	Дубинин	Калининградская область	\N	2	Витальевич	1459db71-c745-48df-8663-7a61abbedc6c
7e0519cb-905b-476a-8216-c1dd1baaff05	leningrad@fsp-russia.com	$2b$12$2MNeQKK4ZFM9lX/gFonVu.ajdg2ou3Sgg5zERqTGr8.w8PL7QenS.	f	f	\N	Виктор	Корф	Ленинградская область	\N	2	Сергеевич	1459db71-c745-48df-8663-7a61abbedc6c
13bc2854-62f8-44cb-845e-cc2c14360441	murmansk@fsp-russia.com	$2b$12$78pzIcYGOdPgzDvoUr2Oo.os8qrn93xnpc07fjf1hcjAwyFTb2bsG	f	f	\N	Денис	Шляпников	Мурманская область	\N	2	Игоревич	1459db71-c745-48df-8663-7a61abbedc6c
85d8188d-1c45-4e41-9b40-c2ee71cb3979	novgorod@fsp-russia.com	$2b$12$tmqo1o7DQrZLgr6/Ag6VEeUcEMBIuJQxUY4vTZ3eK6khUBxrKaUwe	f	f	\N	Михаил	Богданов	Новгородская область	\N	2	Михайлович	1459db71-c745-48df-8663-7a61abbedc6c
2d95f317-facd-4a1f-ad32-ef6e5c02a1f0	pskov@fsp-russia.com	$2b$12$UI3kx0/jUS69YsQ2InPYa.07tANnI1QqBP14A5UjFW6PUDjCHNJ0C	f	f	\N	Марк	Степаненков	Псковская область	\N	2	Валерьевич	1459db71-c745-48df-8663-7a61abbedc6c
8d065616-ab32-4b02-8975-bdab27cbd351	nenets@fsp-russia.com	$2b$12$3aTJ/Mz2WvEraqWjRi8avedeh/GRC.Quv8iNpO/b4qBVH97ypxKMi	f	f	\N	Ирина	Демчик	Ненецкий автономный округ	\N	2	Игоревна	1459db71-c745-48df-8663-7a61abbedc6c
6e3bba70-88af-4add-93cc-fdf4e9cc8ce5	vologda@fsp-russia.com	$2b$12$Fas.H05WQb4bDM0yg5taE.Pa56nzKmR0gQpNp9E.rMh1vlXvnP2qO	f	f	\N	Олег	Мельников	Вологодская область	\N	2	Николаевич	1459db71-c745-48df-8663-7a61abbedc6c
28859249-5806-4f6e-ae6e-e90c3ab372e0	saint-petersburg@fsp-russia.com	$2b$12$dKDTco.jWW.XpAgtvnp8KOIIFsUNmwoNa2zuRZ/wq.74It7lAZ2we	f	f	\N	Денис	Кувиков	г. Санкт Петербург	\N	2	\N	1459db71-c745-48df-8663-7a61abbedc6c
8aa2143f-f72a-41ca-899f-821f4898faab	sakha@fsp-russia.com	$2b$12$jmICkbukO9IweXiPgudIh.7CfgumAL0qQ3lPTUcBj668w75sD/wha	f	f	\N	Николай	Николаев	Республика Саха-Якутия	\N	2	Борисович	6bf0c447-2b69-41a1-81e5-750b462270cf
17a570a4-cca6-40f5-b1d1-6a13cfe45224	kamchatka@fsp-russia.com	$2b$12$jhOkafX4DAO8KjyJPTvQJuZqCeuMdkkm9pUznGei7z.BVlZp6bGqC	f	f	\N	Владимир	Дресвянский	Камчатский край	\N	2	Сергеевич	6bf0c447-2b69-41a1-81e5-750b462270cf
c2ae319c-ebee-4432-b43c-dd50190513bf	primorsky@fsp-russia.com	$2b$12$vayBwYhr7b2kQjo7gkVsD.H4bAdKZ6h/aqYWLp74/.LhSrongKJfy	f	f	\N	Владимир	Снитко	Приморский край	\N	2	Алексеевич	6bf0c447-2b69-41a1-81e5-750b462270cf
beaf738a-fd10-4821-9f54-744445ac6465	khabarovsk@fsp-russia.com	$2b$12$w5xjn.KsIrhUEf/K833zy.61Yv6BdodLVmY2YQcUw/xiDyjDo/md2	f	f	\N	Николай	Бородинов	Хабаровский край	\N	2	Александрович	6bf0c447-2b69-41a1-81e5-750b462270cf
e90bdbed-f42f-43bb-8fa4-ab7a766f7399	amur@fsp-russia.com	$2b$12$UsIMAGrjBYv9MxAJGok0/OqYU/bbF/Tn5PoLxAq9LYAMxLENkozka	f	f	\N	Руслан	Попов	Амурская область	\N	2	Игоревич	6bf0c447-2b69-41a1-81e5-750b462270cf
3f09686f-b1e4-4dd8-9804-f43716238ab8	magadan@fsp-russia.com	$2b$12$zpveHVBeELyz3B4F2rB96.leM2VxWxThSCnW3Ih9PVplEQz7WqYXy	f	f	\N	Антон	Бережной	Магаданская область	\N	2	Константинович	6bf0c447-2b69-41a1-81e5-750b462270cf
91be1224-4e6d-4e96-802e-a097bd63ac79	buryatia@fsp-russia.com	$2b$12$0ojxbdDiMfS.L6PHcT9JneIs0DlioBMdOgAbesnL7WEhX6DckfvC2	f	f	\N	Владимир	Пьянников	Республика Бурятия	\N	2	Сергеевич	6bf0c447-2b69-41a1-81e5-750b462270cf
726c15b7-948c-4e36-a5f8-22c82dec4d33	zabaykalsky@fsp-russia.com	$2b$12$amS/9.PyCrJ1rHeZ.hJ2xemn4zdJAtXHoqKyEGj/bj1NWSN8EHAV6	f	f	\N	Тарас	Метельский	Забайкальский край	\N	2	Леонидович	6bf0c447-2b69-41a1-81e5-750b462270cf
c1ad080c-7163-46f8-9938-b6182ece5974	sakhalin@fsp-russia.com	$2b$12$3AgXH6P/43mej5dBafSrH.jeFjwB.1a6wvuVuzNzdelt1HEUOkBGm	f	f	\N	Евгений	Соболев	Сахалинская область	\N	2	Игоревич	6bf0c447-2b69-41a1-81e5-750b462270cf
98475d73-0619-48b8-8419-f7e82e59715c	jewish@fsp-russia.com	$2b$12$LTmkYcpRc.CVgNEFkfSv.uWJDPMuf4xqzorEPF4vX4VaZF/po8NKi	f	f	\N	Григорий	Пешков	Еврейский АО	\N	2	Сергеевич	6bf0c447-2b69-41a1-81e5-750b462270cf
3d6ae3a3-3093-4ede-9dcb-87d1e1cb11fa	chukotka@fsp-russia.com	$2b$12$AoWhvKKrbLPaMAE77q/91OMof9c0S0427vDMJzq7nrfgXrS/jCZrq	f	f	\N	Георгий	Косов	Чукотский АО	\N	2	Александрович	6bf0c447-2b69-41a1-81e5-750b462270cf
9bca9b5d-1e6b-49aa-9b5f-4bd4d32e0141	altai@fsp-russia.com	$2b$12$YDeQwZQk.Qj.QXzq0mIb.ur8UnBr31Mq3FXD6pY0P1lQZf4uyo7CS	f	f	\N	Светлана	Шило	Республика Алтай	\N	2	Анатольевна	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
c0c7895f-d8b2-40df-8ef9-86a09bfc6b28	tuva@fsp-russia.com	$2b$12$LPJCbCKeGGmjmyv5VZoQ.OeZ7FUuCnUo9BR9088hllZoviG.nDToi	f	f	\N	Субудай	Оюн	Республика Тыва	\N	2	Викторович	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
4778889b-83f7-47ae-8bd9-89dd44080383	khakassia@fsp-russia.com	$2b$12$Mg4/cwkIb58a6PEKVl.Bae5cH6pFrauBvs7aG8LZPdm9WrqpJzsc2	f	f	\N	Денис	Шпигальский	Республика Хакасия	\N	2	Олегович	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
44eaaa40-a1d4-4bc7-a544-3b9b507b7ba7	altai-k@fsp-russia.com	$2b$12$O2eGGOzFFStMn5MNdm/yTuqvavpg6FMTZzy6gTlVhvnFVwQuGWRXi	f	f	\N	Алексей	Егораев	Алтайский край	\N	2	Анатольевич	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
c19b14a1-3a04-4003-937f-9554cc628075	krasnoyarsk@fsp-russia.com	$2b$12$tBWvK6d/0ddwkvsctnQsQOrDKi4amXR2PX9ezcTN1VkVWeJUEpLl.	f	f	\N	Денис	Капулин	Красноярский край	\N	2	Владимирович	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
155f5dc6-7a95-496f-a273-16b97d85a4ee	irkutsk@fsp-russia.com	$2b$12$NwWIjeMTahGUZvQugtJO3eQ47P/fQVwVyZCAh4LqhYs4weJOSLSNG	f	f	\N	Роман	Ищенко	Иркутская область	\N	2	\N	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
069591e7-1a34-44e6-82ec-75eaf34410f0	kuzbass@fsp-russia.com	$2b$12$hPTTrHucsIilvY1bfLoJ8uYCSKThxIyPB1Nu4ghHsjEmI9kHzCr5G	f	f	\N	Александр	Попов	Кемеровская область - Кузбасс	\N	2	Сергеевич	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
6f8c5b5b-15fe-4dc4-8ee6-e39eb93b1384	novosiblrsk@fsp-russia.com	$2b$12$.g3YHqoljzgtuV4LFOLiy.jcokm8l/hwwiXi0NcyCFTUaHPNHSw/G	f	f	\N	Максим	Данилов	Новосибирская область	\N	2	Олегович	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
217f6b9e-2074-4146-8131-0bd3b8418499	omsk@fsp-russia.com	$2b$12$I2qGBWNlwxe2E5cnSkEml.IbPEj9rhTnkdUucpiv8iUUJKDlcBVja	f	f	\N	Юрий	Иванищев	Омская область	\N	2	Ильич	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
b46c6a55-1de0-4ae3-9df1-02c82d061194	tomsk@fsp-russia.com	$2b$12$28/mmOpZk75M9ccq6fo01e/H8Oj2b2FK1O7U.ouZ7XsfYTxR02pAS	f	f	\N	Дмитрий	Буинцев	Томская область	\N	2	Николаевич	632a47b7-8edb-4ca7-918a-e9f2a0fc29ff
c113579f-0f70-409e-9dfd-25307a21dfcc	kurgan@fsp-russia.com	$2b$12$Q72H4RLrhNBb2whp1AHfqOZ.Tql5eCQIZ8olKRLl48zl7Pav.HiXm	f	f	\N	Михаил	Белоусов	Курганская область	\N	2	Александрович	36323e99-62df-420d-907f-7cf7be895c15
0b07d0a2-c262-41d7-b0f7-98890c212e4a	sverdlovsk@fsp-russia.com	$2b$12$l.hwPIxyBbLO9nogAOd6hulypnakYk50NDdNK9EKLbMYyTFoCv1Fe	f	f	\N	Илья	Обабков	Свердловская область	\N	2	Николаевич	36323e99-62df-420d-907f-7cf7be895c15
d6c9c1c4-261e-4e99-b034-79edab53ec2d	tyumen@fsp-russia.com	$2b$12$8760lJUA94wioFN7xptcjOKqHINSbWogkgcj5/Q6l3kEoSOq4uiM.	f	f	\N	Людмила	Сенкевич	Тюменская область	\N	2	Борисовна	36323e99-62df-420d-907f-7cf7be895c15
8db9be85-0cca-448f-8c91-ad77d7e67008	chelyablnsk@fsp-russia.com	$2b$12$lU3rfePCavFoZ6OmSU3wquAzYuaNjLyliuS.NOP4LAFuN2LJw4Iy.	f	f	\N	Сергей	Нечет	Челябинская область	\N	2	Геннадьевич	36323e99-62df-420d-907f-7cf7be895c15
943bd43a-f41b-451d-9dd6-5e4ee0dbe8d3	hmao@fsp-russia.com	$2b$12$PnYao0gzXNepUPT0cIcwpeY.9Ez7kz0NvGP1VUNEsGE4.Ob5VEE5u	f	f	\N	Родион	Давлетшин	Ханты-Мансийский автономный округ – Югра	\N	2	Айратович	36323e99-62df-420d-907f-7cf7be895c15
d6df98ca-5c22-4ce9-85c6-8b891a6047f4	yamalo-nenets@fsp-russia.com	$2b$12$hJunHJlhT5oAupdAhrnCGuHnx.Ng5CuZhVCRarFBUpOsmdCZ2yrJK	f	f	\N	Лариса	Гашимова	Ямало-Ненецкий АО	\N	2	Павловна	36323e99-62df-420d-907f-7cf7be895c15
6e1eb18a-8342-4221-9832-a58391379d44	bashkortostan@fsp-russia.com	$2b$12$/EY.yMiTjn6Ctj4BI6JXcutmHy4f5Bh3sYmXjivlYl7a.GxOI.1dS	f	f	\N	Валиахметова	Юлия	Республика Башкортостан	\N	2	\N	a17c6494-de2a-4edb-a4db-3bcf95f832f3
686ca8cd-eb4b-4504-bba6-c15b51f09420	mari-ei@fsp-russia.com	$2b$12$5IcGvD5hPFZWbv8iGSABMemKk3qFZLEwDPSi9ylYZ8f.ZeIuAev2G	f	f	\N	Екатерина	Куликова	Республика Марий Эл	\N	2	Ивановна	a17c6494-de2a-4edb-a4db-3bcf95f832f3
ccfb0933-2738-4879-b62f-862b793a25f8	mordovia@fsp-russia.com	$2b$12$j.mol4rGspI9InYcorUohe0pDj30gf8QiLoH8Q7mFWxT306SDPIx.	f	f	\N	Дмитрий	Бекшаев	Республика Мордовия	\N	2	Александрович	a17c6494-de2a-4edb-a4db-3bcf95f832f3
3c2fd9d3-b869-4e1c-97f4-b09219e92fa5	fsprt@inbox.ru	$2b$12$yrN1s06QxzzQM41x7qrv7Owre9DDZw0AZEDQhAc0c1OIVZ//KUxui	f	f	\N	Евгений	Серочудинов	Республика Татарстан	\N	2	Сергеевич	a17c6494-de2a-4edb-a4db-3bcf95f832f3
ab15bdcb-acda-4bec-9db7-826adffc73fd	udmurtia@fsp-russia.com	$2b$12$MHg1nnezLhd0A7FkCGPkheSvKzoAhS7dVQ3Q7Jvd4ubA8U7pWpKzW	f	f	\N	Сергей	Пигалев	Удмуртская Республика	\N	2	Александрович	a17c6494-de2a-4edb-a4db-3bcf95f832f3
b8515917-f2af-437c-9ca8-cd3dd829e967	fspchuv@mail.ru	$2b$12$9LyEXVHXSuRDZusgASgsR.Tug9Dn1xLKpFx9ZSSIz1qKMSqGyNWIu	f	f	\N	Александр	Набиев	Чувашская Республика	\N	2	Эльдарович	a17c6494-de2a-4edb-a4db-3bcf95f832f3
a37ce23c-59b6-4447-9cc4-d563606bc30f	kirov@fsp-russia.com	$2b$12$N0LhYI7B9/cKxkl7e5ANj.1CBJWwslEzb5fMgGFkN8RZeXWlc1TBG	f	f	\N	Дмитрий	Кокарев	Кировская область	\N	2	Михайлович	a17c6494-de2a-4edb-a4db-3bcf95f832f3
81e10c4c-8245-42d2-8c92-dc00720c490b	nizhny-novgorod@fsp-russia.com	$2b$12$fqdq2/qD.Aqm8YEYMlMvr.hGYDNP0LzTBJKuAZWgMcG45HTSvcgVm	f	f	\N	Михаил	Небольсин	Нижегородская область	\N	2	Юрьевич	a17c6494-de2a-4edb-a4db-3bcf95f832f3
7427c808-fc6c-41f6-9bbe-d551e7f3fdc2	orenburg@fsp-russia.com	$2b$12$91vjc0kG3oFLvVnCIp85nOds85N0xPf0cwdmcQtozqVa9Xy5YfIcK	f	f	\N	Дмитрий	Вечеренко	Оренбургская область	\N	2	Сергеевич	a17c6494-de2a-4edb-a4db-3bcf95f832f3
91a07f77-0691-43ed-be0c-5cae5a33b77c	penza@fsp-russia.com	$2b$12$qtg8qfqRbmM2aMjDMTgMI.YBThJB0p6s5epJ6qnP2lPgAqQhU7gqe	f	f	\N	Алина	Строителева	Пензенская область	\N	2	Андреевна	a17c6494-de2a-4edb-a4db-3bcf95f832f3
b4ffa600-eb86-4a9d-b686-8726d986e1d8	perm@fsp-russia.com	$2b$12$qE5eDN9B37f5R0jmIEFyL.yEGl1UglUVHjmbSiuMNwycbzzpX6iPe	f	f	\N	Оскар	Ягофаров	Пермский край	\N	2	Фаитович	a17c6494-de2a-4edb-a4db-3bcf95f832f3
f2790746-cfb5-4560-939e-f0d4862288dd	samara@fsp-russia.com	$2b$12$RsXapG.3mtD.C7/6ykZUb.yxbUtUg75rIDwnwjpP/aWYvVmHine6K	f	f	\N	Михаил	Бабенко	Самарская область	\N	2	Владимирович	a17c6494-de2a-4edb-a4db-3bcf95f832f3
f7adf1ea-4045-4c10-97d8-27d899d6750d	saratov@fsp-russia.com	$2b$12$o25ty6nswxK5UvOoX0V/xO4X.fJeDhz0I136xZEW/AhxiJj66/p8S	f	f	\N	Антонина	Федорова	Саратовская область	\N	2	Гавриловна	a17c6494-de2a-4edb-a4db-3bcf95f832f3
8467ba2c-0ac8-4c39-abbe-0db86787620e	ulyanovsk@fsp-russia.com	$2b$12$QajLtMyVRDJbXiX1yYRIdetfzrx.yQqqSVkSPnlteJe1b395CyAeO	f	f	\N	Вадим	Павлов	Ульяновская область	\N	2	Вячеславович	a17c6494-de2a-4edb-a4db-3bcf95f832f3
6fccf390-4268-40ce-b416-70258d289f0d	Fsprd@mail.ru	$2b$12$eoZAaCEf0gUf5lK/ZCn0YOZPbog5JbGHenYVDX9RQaAayMFeB2Vx2	f	f	\N	Магомед	Абдулаев	Республика Дагестан	\N	2	Магомедгаджиевич	80768e35-655d-4780-93e1-52246a893926
ac44a5c6-5852-4144-b861-d4e5ccefbed8	lngushetia@fsp-russia.com	$2b$12$L0GekbWosaHHZXcOtDVT3.q5L9DX6fbTQxKVSQBEGgaO/vWZvxkcq	f	f	\N	Роман	Найденко	Республика Ингушетия	\N	2	Анатольевич	80768e35-655d-4780-93e1-52246a893926
8b6d80cb-f1cf-4e69-be0b-06ac51bc441d	kabardino-balkaria@fsp-russia.com	$2b$12$P7ArQVTTAYhqGm2EJM3LRugdVANCjogi7c1qcU8iDnhfF0Fcazdyq	f	f	\N	Мурат	Тюбеев	Кабардино-Балкарская Республика	\N	2	Абдуллахович	80768e35-655d-4780-93e1-52246a893926
e1b1de7f-ff50-4801-b8f1-1095e540251c	karachay-cherkessia@fsp-russia.com	$2b$12$GxyYX96oT10saUiW3HAm3.OqZzUqa1UWaXiiFVPLfnfaIz/GUvAUC	f	f	\N	Константин	Андропов	Карачаево-Черкесская Республика	\N	2	Сергеевич	80768e35-655d-4780-93e1-52246a893926
f96b818e-68f5-445c-a58e-8b93c9480ace	ossetia-alania@fsp-russia.com	$2b$12$d9Q/HJ4KntcJqxa412nRUuIJMFj/OfMdj4OzzDB33IVXj1gQezGa.	f	f	\N	Александр	Нартиков	Республика Северная Осетия - Алания	\N	2	Георгиевич	80768e35-655d-4780-93e1-52246a893926
13e09a9a-9828-4640-b0b9-5b60a6e2709d	stavropol@fsp-russia.com	$2b$12$Zl3C1kZnXSfKj9SAJtbxlOf.NoxjSgsXWwtBUrHwtTLUlhjtPWOc6	f	f	\N	Дмитрий	Пижевский	Ставропольский край	\N	2	Евгеньевич	80768e35-655d-4780-93e1-52246a893926
db92ea7c-d7d4-462d-8b78-975c849ea749	chechnya@fsp-russia.com	$2b$12$u.ak1dSsOgbE1A5B.oySGuoinKsY7IY0./Ki7YIcS57Xn9D7nJKFW	f	f	\N	Зубайр	Саидов	Чеченская Республика	\N	2	Ахмедович	80768e35-655d-4780-93e1-52246a893926
29d2362e-4eaf-4532-91f5-517be456c561	fsp-dnr@mail.ru	$2b$12$IKXrz4DRSY9ysofXGRbd3uuMJV6QGsFzwavN4SH5zI5C6kzhAQvJ.	f	f	\N	Игорь	Станков	Донецкая Народная Республика	\N	2	Валентинович	6b1e7440-d311-47f7-83b4-6d0c20295b78
d54e92eb-d0e3-4231-8cbd-524fef67b744	fsp_lnr@mail.ru сайт: www.fsp-lnr.ru	$2b$12$954ChK97PS2QoVKAdRXNbOK4yAAYgAkBbDxCyvyn5do3bWScERg.y	f	f	\N	Ольга	Мальцева-Светличная	Луганская Народная Республика	\N	2	Валерьевна	6b1e7440-d311-47f7-83b4-6d0c20295b78
6b9d8187-eeda-407b-b554-c5365dd176ea	directum@fsp-zo.ru	$2b$12$uR6ukG9DJH516hNREGlLT.ddmqJ6tGmSqMMS6euFydvPOOp1Ib7t.	f	f	\N	Дмитрий	Букреев	Запорожская область	\N	2	\N	6b1e7440-d311-47f7-83b4-6d0c20295b78
fa145d54-9ed1-4fe7-aeef-49f4ad9d3ea9	kherson@fsp-russia.com	$2b$12$APWnRFybEbEAnxFvFVuvwOIFC04o3s/GyUHbBpFA.1PC8eAgRAMGe	f	f	\N	Не укзано	\N	Херсонская область	\N	2	\N	6b1e7440-d311-47f7-83b4-6d0c20295b78
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: confirm_session confirm_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.confirm_session
    ADD CONSTRAINT confirm_session_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: refresh_session refresh_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.refresh_session
    ADD CONSTRAINT refresh_session_pkey PRIMARY KEY (refresh_token);


--
-- Name: reset_session reset_session_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.reset_session
    ADD CONSTRAINT reset_session_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_confirm_session_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_confirm_session_id ON public.confirm_session USING btree (id);


--
-- Name: ix_refresh_session_refresh_token; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_refresh_session_refresh_token ON public.refresh_session USING btree (refresh_token);


--
-- Name: ix_reset_session_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_reset_session_id ON public.reset_session USING btree (id);


--
-- Name: confirm_session confirm_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.confirm_session
    ADD CONSTRAINT confirm_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: refresh_session refresh_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.refresh_session
    ADD CONSTRAINT refresh_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: reset_session reset_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.reset_session
    ADD CONSTRAINT reset_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_district_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.districts(id) ON DELETE CASCADE;


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

