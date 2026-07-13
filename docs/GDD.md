# Flutter Fighter

Version: 0.1

Author: Saurabh Dash

Date Started: July 2026

Engine:
- Flutter
- Flame Engine

Backend:
- Spring Boot
- WebSocket
- MySQL

Platforms:
- Android
- Web
- Windows (Future)

# Table of Contents

- [Game Overview](#1-game-overview)
- [Core Vision](#2-core-vision)
- [Target Audience](#3-target-audience)
- [Gameplay Loop](#4-gameplay-loop)
- [Story](#5-story)
- [Characters](#6-characters)
- [Combat System](#7-combat-system)
- [Controls](#8-controls)
- [Game Modes](#9-game-modes)
- [Weapons](#10-weapons)
- [Maps](#11-maps)
- [Progression](#12-progression)
- [Economy](#13-economy)
- [UI / UX](#14-ui--ux)
- [Backend Architecture](#15-backend-architecture)
- [Multiplayer](#16-multiplayer)
- [Audio](#17-audio)
- [Art Style](#18-art-style)
- [Technical Stack](#19-technical-stack)
- [Development Roadmap](#20-development-roadmap)




# 1. Game Overview

## Game Name
Flutter Fighter

## Genre
2D Multiplayer Fighting Game

## Game Engine
Flutter + Flame Engine

## Backend
Java Spring Boot + WebSocket + MySQL + Firebase

## Platforms
- Android
- Web
- Windows (Future)

## Camera
2D Side View

## Art Style
Retro Pixel Art (Initial Version)
High Quality 2D Animated Style (Future)

## Match Type
1 vs 1

## Match Duration
2–5 Minutes

## Multiplayer
Online Room Code
Local Multiplayer (Future)

## Target FPS
60 FPS

## Target Resolution
Portrait and Landscape Support

## Minimum Android Version
Android 8.0+

## Target Audience
Age 12–35

## Game Goal

Players battle each other using fast-paced combat mechanics.
The winner is the player who reduces the opponent's health to zero before the timer ends.

The game focuses on:
- Skill-based combat
- Fast matchmaking
- Smooth controls
- Online multiplayer
- Unlockable cosmetics
- Daily rewards

# 2. Core Vision

## Vision Statement

Nexus Clash is a fast-paced 2D multiplayer fighting game where players from different dimensions battle in unique arenas using skill-based combat, strategic abilities, and quick online matches.

The game focuses on fair competition, responsive controls, and exciting gameplay rather than pay-to-win mechanics.

Players can challenge friends instantly using room codes, fight AI opponents, complete daily missions, unlock cosmetic rewards, and climb the global leaderboard.

Every match should feel exciting, rewarding, and encourage players to play "just one more match."

---

## Core Pillars

### 1. Skill First

Victory should depend on player skill rather than purchased advantages.

### 2. Fast Matches

Each match should last between 2 and 5 minutes.

### 3. Responsive Controls

Player movement and attacks should feel smooth and immediate.

### 4. Fair Multiplayer

Low latency gameplay with synchronized combat using WebSockets.

### 5. Rewarding Progression

Players should always earn something after every match.

### 6. Easy To Learn

Simple controls that beginners understand quickly.

### 7. Hard To Master

Advanced mechanics such as combos, parries, air attacks, and movement techniques reward experienced players.

### 8. Regular Updates

New characters, skins, maps, and events will be added over time.


## Unique Selling Points
- Instant room-code multiplayer without complicated setup.
- Lightweight download size.
- Cross-platform support (Android, iOS, Web).
- Skill-based combat with no pay-to-win mechanics.
- Daily challenges and seasonal events.
- Fast matchmaking and quick game sessions.
- Responsive controls optimized for mobile devices.
## Player Experience

Players should feel:

- Excited during combat.
- Rewarded after every match.
- Motivated to unlock new content.
- Competitive while climbing ranks.
- Confident that winning depends on skill.
## Emotional Goals

- Excitement
- Competition
- Satisfaction
- Achievement
- Progress
- Fun
## What Nexus Clash Is NOT

- Not pay-to-win.
- Not an open-world RPG.
- Not a story-driven adventure.
- Not a battle royale.
- Not dependent on expensive graphics.
- Not focused on grinding.
## Long-Term Vision

Nexus Clash aims to become a competitive cross-platform multiplayer fighting game that is easy to learn but difficult to master.

The game will grow through new fighters, seasonal content, online events, ranked gameplay, and community feedback while maintaining balanced and enjoyable combat.


# 3. Target Audience

## Primary Audience

- Age: 13–30
- Platform: Android, iOS
- Player Type:
    - Competitive Players
    - Casual Players
    - Students
    - Friends Playing Together
    - Mobile Gamers

---

## Secondary Audience

- PC Players (Future)
- Streamers
- Esports Enthusiasts
- Fighting Game Fans

---

## Player Types

### Casual Players

Players who want quick matches during breaks or free time.

Expected Match Time:
2–5 minutes

---

### Competitive Players

Players who enjoy mastering mechanics, improving rankings, and climbing leaderboards.

Goals:
- Rank Up
- Improve Skills
- Unlock Achievements

---

### Social Players

Players who mainly play with friends using room codes.

Goals:
- Private Matches
- Friendly Competition
- Local Tournaments

---

## Regions

Initial Release

- India
- United States
- Canada
- United Kingdom
- Australia

Future Expansion

- Europe
- Japan
- South Korea
- Brazil

---

## Devices

Minimum

- Android 8+
- 3 GB RAM

Recommended

- Android 11+
- 6 GB RAM

Future

- iPhone
- iPad
- Windows
- Web

---

## Player Session

Average Session

10–20 minutes

Average Match

2–5 minutes

Daily Play Time

20–45 minutes

---

## Why Players Will Return

Players come back because:

- Daily rewards
- Daily missions
- Ranked progression
- Unlockable cosmetics
- Fast matchmaking
- Playing with friends
- Seasonal events

## Player Personas

### Rahul (Student)

Age: 19

Plays:
20 minutes after college.

Likes:
Fast matches.
Competition.

---

### Emma (Casual Player)

Age: 24

Plays:
While commuting.

Likes:
Simple controls.
Quick games.

---

### Alex (Competitive Player)

Age: 22

Goal:
Become top ranked.

Plays:
Every day.

Focus:
Mastering combos and improving skills.

## Competitor Analysis

| Game | Strength | What Nexus Clash Does Differently |
|------|----------|----------------------------------|
| Brawlhalla | Large roster, polished combat | Faster mobile-first experience with instant room codes |
| Smash Bros. | Deep mechanics | Mobile accessibility and cross-platform support |
| Shadow Fight Arena | Strong visuals | Simpler controls and shorter matches |
| Skullgirls Mobile | Character depth | Faster multiplayer and competitive focus |