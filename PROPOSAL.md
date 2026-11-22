# KindSpeechCo: AI-Powered Business Management and Speech Therapy Platform

## 1. Project Overview

KindSpeechCo is a proposed speech therapy business focused on helping teens and adults strengthen their speech, language, and communication skills. The business aims to help clients build confidence in everyday social, academic, and professional interactions.

This project will develop a functional, database-driven business management application for KindSpeechCo. The application will help the business owner organize daily operations through a centralized platform for managing client records, appointments, speech therapy activities, and lesson plans. It will incorporate AI-powered tools and business analytics to make business information easier to access, manage, and understand.

For this project, fictional client and business records will be used to simulate an established, growing speech therapy practice.

## 2. Problem Statement and Project Goal

As a speech therapy practice grows, managing client information, appointments, assigned activities, and business performance can become increasingly difficult without a centralized system. This project addresses that need by creating an application that brings these business operations together.

The primary goal is to build a working business management application that combines database management, AI-powered tools, and business intelligence.

The application will allow the owner and authorized staff to:

- Manage client records, appointments, speech therapy activities, and lesson plans.
- Use an AI Business Assistant to retrieve database information and answer operational questions.
- Submit administrative change requests for staff review and approval.
- View a Business Intelligence Dashboard displaying appointment attendance, activity completion, client engagement, and operational trends.

The application will demonstrate how AI, database systems, and analytics can work together to improve organization, support decision-making, and help a speech therapy business grow.

## 3. Market Research and Project Opportunity

Existing platforms such as Constant Therapy and Tactus Therapy provide structured speech, language, and communication exercises, while practice management platforms such as TheraPlatform offer scheduling, client management, and interactive resources.

Research evaluating speech-language therapy applications has identified opportunities to improve user engagement, personalization, and interactive experiences.

KindSpeechCo aims to complement these existing services by combining business management tools with a more practical, engaging approach to speech therapy and communication development.

## 4. Customer Experience and Speech Therapy Features

Although business management is the primary focus, the application will also support the customer experience through speech therapy activities and communication practice.

**Everyday Life Skills:** Clients can explore realistic situations involving social interactions, workplace conversations, introductions, and self-advocacy. They can consider different responses and receive constructive feedback.

**Adaptive Speech Therapy Activities:** Activities will be organized into six areas:

- Social Communication
- Conversational Confidence
- Workplace Communication
- Pronunciation and Articulation
- Language Comprehension and Vocabulary
- Self-Advocacy

Activities will include Beginner, Intermediate, and Advanced difficulty levels.

**AI Activity Creator:** The owner or authorized staff can generate draft activities based on a selected topic, audience, difficulty, and learning objective. Staff will review content before assigning it.

A separate client-facing portal and AI Practice Assistant may be explored as future development.

## 5. Database Design and AI Functionality

The application will use a SQLite database with five primary tables:

- `clients` – basic client information and enrollment status.
- `appointments` – appointment scheduling and attendance.
- `activities` – speech therapy activities and difficulty levels.
- `lesson_plans` – activities assigned to clients and completion status.
- `change_requests` – administrative changes awaiting staff approval.

The AI Business Assistant will use read-only database lookup tools and a separate change-request tool. It will not directly modify business records. Authorized staff will review and approve or reject requests before changes are applied.

## 6. Privacy and Human Oversight

The prototype will use fictional sample data. Diagnoses, medical histories, and clinical evaluation details will not be stored or sent to the AI model. Requests involving clinical diagnoses or recommendations will be referred to a qualified professional.

The application is intended to support business organization and communication practice, not replace professional speech therapy services.

## 7. Future Development

The long-term vision for KindSpeechCo is to develop a separate client-facing portal where clients can access assigned activities, complete interactive exercises, and practice communication skills independently.

An additional AI Practice Assistant could provide guided practice while maintaining separate permissions from the private Business Assistant.

## 8. Project Vision

KindSpeechCo aims to bring together business organization, AI-assisted administrative tools, business intelligence, and engaging speech therapy experiences.

By prioritizing the business management application while incorporating a complementary customer experience, this project will demonstrate how technology can support both the operations of a speech therapy business and the clients it serves.

## Research References

- Vaezipour et al. (2020). Research evaluating mobile applications for adults with communication disorders. *JMIR mHealth and uHealth*.
- *JMIR* (2022). Research examining stakeholder perspectives and app-store reviews of speech-language therapy applications.
- Constant Therapy, Tactus Therapy, and TheraPlatform. Product information and descriptions of existing speech therapy and practice management platforms.