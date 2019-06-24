import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Main {

    public static void main(String[] args) {
        WebDriver browser;
        browser = new ChromeDriver();
        browser.get("http://127.0.0.1:8080");
        WebElement button = browser.findElement(By.id("about"));
        assert(button.isDisplayed());
        button.click();
        browser.close();
    }
}
