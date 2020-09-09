# Undika WhatsApp Sticker

WhatsApp sticker project on Flutter.
## Available in PlayStore

<a href="https://play.google.com/store/apps/details?id=com.dinamika.undika_wastiker">![640px-Google_Play_Store_badge_EN svg](https://user-images.githubusercontent.com/13075784/85202629-55087180-b325-11ea-8307-acf71c9b7022.png)
</a>

Steps to add extra stickers:
1. Create folder inside with number-only name inside sticker_packs folder
2. Add sticker images with these conditions (.webp format, below 50KB, 512 x 512 resolution)
3. Name must not using letter space (' '), preffered underline symbol ('_')
4. For the tray icon, place inside the same folder, must be .png format and below 50KB, no-spacing name
5. Update sticker_packs.json ("identifier" value must be same with new folder created, "tray_image_file" value must be same with tray icon filename, "image_file" value must be same with sticker filename)


References used from [this project](https://github.com/AkramChauhan/WhatsApp-Stickers-using-Flutter).

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
