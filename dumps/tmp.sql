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
    role_id integer NOT NULL
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
4aa261fb5e25
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
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, email, hashed_password, is_verify, is_deleted, number, first_name, last_name, region, is_man, role_id) FROM stdin;
3da3d10c-b42f-47ab-85cb-e53440b7bac3	╤Л╨▓╨░╤Л@asd.ru	$2b$12$YDBW6hj2nnX7KFq7r6qBQ.EWbc6OD7yt9tfCzkZY101UMSmQQqeK.	f	f	78888888888	string	string	╨д╨╡╨┤╨╡╤А╨░╨╗╤М╨╜╤Л╨╣ ╨║╤А╤Г╨│	f	1
40b8b069-2be6-4ff7-a94c-e78f814cc63f	admin@admin.com	$2b$12$47byza6xD9e/YaknLwKV.O5eDuznoN01LC6KAAIiXWV1gywHg8QTe	f	f	79999999999	admin	admin	╨д╨╡╨┤╨╡╤А╨░╨╗╤М╨╜╤Л╨╣ ╨║╤А╤Г╨│	t	2
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


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
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

