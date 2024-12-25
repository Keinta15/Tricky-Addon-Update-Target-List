import { execCommand, showPrompt } from './main.js';

const bootHashOverlay = document.getElementById('boot-hash-overlay');
const card = document.getElementById('boot-hash-card');
const inputBox = document.getElementById('boot-hash-input');
const saveButton = document.getElementById('boot-hash-save-button');

// Function to handle Verified Boot Hash
export async function setBootHash() {
    const showCard = () => {
        bootHashOverlay.style.display = "flex";
        card.style.display = "flex";
        requestAnimationFrame(() => {
            bootHashOverlay.classList.add("show");
            card.classList.add("show");
        });
        document.body.style.overflow = "hidden";
    };
    const closeCard = () => {
        bootHashOverlay.classList.remove("show");
        card.classList.remove("show");
        setTimeout(() => {
            bootHashOverlay.style.display = "none";
            card.style.display = "none";
            document.body.style.overflow = "auto";
        }, 200);
    };
    showCard();
    try {
        const bootHashContent = await execCommand("cat /data/adb/boot_hash");
        const validHash = bootHashContent
            .split("\n")
            .filter(line => !line.startsWith("#") && line.trim())[0];
        inputBox.value = validHash || "";
    } catch (error) {
        console.warn("Failed to read boot_hash file. Defaulting to empty input.");
        inputBox.value = "";
    }
    saveButton.addEventListener("click", async () => {
        const inputValue = inputBox.value.trim();
        try {
            await execCommand(`echo "${inputValue}" > /data/adb/boot_hash`);
            await execCommand(`su -c resetprop -n ro.boot.vbmeta.digest ${inputValue}`);
            showPrompt("prompt.boot_hash_set");
            closeCard();
        } catch (error) {
            console.error("Failed to update boot_hash:", error);
            showPrompt("prompt.boot_hash_set_error", false);
        }
    });
    bootHashOverlay.addEventListener("click", (event) => {
        if (event.target === bootHashOverlay) closeCard();
    });
}