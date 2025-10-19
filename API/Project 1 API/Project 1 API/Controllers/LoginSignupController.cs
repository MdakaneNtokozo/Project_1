using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Models;
using Project_1_API.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Project_1_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginSignupController(Project1DatabaseContext context, JWTServices jwts) : ControllerBase
    {
        private readonly Project1DatabaseContext _context = context;
        private readonly JWTServices _jwts = jwts;
        private readonly PasswordHasher<User> _passwordHasher = new PasswordHasher<User>();

        [HttpPost]
        [Route("signUp")]
        public async Task<Object> SignUp(User user)
        {
            List<User> users = await _context.Users.ToListAsync();
            var signUserIn = users.Find(u => u.UserEmail.Equals(user.UserEmail));
            if (signUserIn != null)
            {
                return BadRequest("This email is already in use.");
            }

            user.UserId = users.Last().UserId + 1;
            user.UserPassword = _passwordHasher.HashPassword(user, user.UserPassword);
            await _context.Users.AddAsync(user);
            await _context.SaveChangesAsync();
            return Created();
        }

        [HttpGet]
        [Route("login")]
        public async Task<Object> Login(String email, String password)
        {
            int idxAtSymbol = email.IndexOf('@');
            int idxFullStop = email.IndexOf('.', idxAtSymbol);
            String emailUsed = email.Substring(idxAtSymbol + 1, idxFullStop - idxAtSymbol - 1);

            if (emailUsed.Equals("work"))
            {
                //var admins = await _context.Admins.ToListAsync();
                //return IsAdmin(admins, email, password);
                return 0;
            }
            else
            {
                var users = await _context.Users.ToListAsync();
                return IsUser(users, email, password);
            }
        }

        private Object IsUser(List<User> users, String email, String password)
        {
            User? user = users.Find(u => u.UserEmail.Equals(email));
            if (user != null)
            {
                var result = _passwordHasher.VerifyHashedPassword(user, user.UserPassword, password);
                if (result == PasswordVerificationResult.Success)
                {
                    //1 means they are an admin
                    return Ok($"1 {jwts.GenerateToken(user.UserEmail)} {user.UserId}");
                }
                else
                {
                    return BadRequest("Incorrect details were entered. Please try again.");
                }
            }

            return NotFound("This email does not exist.");
        }

        [Authorize]
        [HttpGet]
        [Route("getUserById/{id}")]
        public async Task<Object> getUserById(int id)
        {
            var users = await _context.Users.ToListAsync();
            var user = users.Find(u => u.UserId == id);

            return Ok(user);
        }

        //private Object IsAdmin(List<Admin> admins, String email, String password)
        //{

        //    Admin? admin = admins.Find(a => a.AdminEmail.Equals(email));

        //    if (admin != null)
        //    {
        //        var result = _passwordHasher.VerifyHashedPassword(null, admin.AdminPassword, password);
        //        if (result == PasswordVerificationResult.Success)
        //        {
        //            //2 means they are an admin
        //            return Ok($"2 {jwts.GenerateToken(admin.AdminEmail)}");
        //        }
        //        else
        //        {
        //            return BadRequest("Incorrect details were entered. Please try again.");
        //        }
        //    }
        //    return NotFound("This email does not exist.");
        //}

        [Authorize]
        [HttpGet]
        [Route("users")]
        public async Task<Object> GetUsers()
        {
            return Ok(await _context.Users.ToListAsync());
        }

        [Authorize]
        [HttpGet]
        [Route("getSpenderTypes")]
        public async Task<Object> GetSpenderTypes()
        {
            return Ok(await _context.SpenderTypes.ToListAsync());
        }

        [HttpDelete]
        [Route("{id}")]
        public async Task<Object> DeleteUser(int id)
        {
            var users = await _context.Users.ToListAsync();
            var user = users.Find(u => u.UserId == id);
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }

    }
}
