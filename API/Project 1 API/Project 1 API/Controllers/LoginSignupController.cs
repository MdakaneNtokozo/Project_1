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
    public class LoginSignupController : ControllerBase
    {
        private readonly Project1DatabaseContext _context;
        private readonly JWTServices _jwts;
        private readonly PasswordHasher<User> _passwordHasher = new PasswordHasher<User>();

        public LoginSignupController(Project1DatabaseContext context, JWTServices jwts)
        {
            _context = context;
            _jwts = jwts;
        }

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
            var users = await _context.Users.ToListAsync();
            User? user = users.Find(u => u.UserEmail.Equals(email));
            if (user != null)
            {
                var result = _passwordHasher.VerifyHashedPassword(user, user.UserPassword, password);
                if (result == PasswordVerificationResult.Success)
                {
                    return Ok($"{_jwts.GenerateToken(user.UserEmail)} {user.UserId}");
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

            if (user != null)
            {
                _context.Users.Remove(user);
                await _context.SaveChangesAsync();
            }

            return NoContent();
        }

        [Authorize]
        [HttpPut]
        [Route("updateProfile")]
        public Object UpdateProfile(User user) {
            _context.Users.Update(user);
            _context.SaveChanges();
            return Ok(user);
        }

        [HttpPut]
        [Route("updatePassword")]
        public async Task<Object> UpdatePassword(int userId, String oldPassword, String newPassword)
        {
            var users = await _context.Users.ToListAsync();
            var user = users.Find(u => u.UserId == userId);
            var result = new PasswordVerificationResult();

            if (user != null)
            {
                result = _passwordHasher.VerifyHashedPassword(user, user.UserPassword, oldPassword);
                if (result == PasswordVerificationResult.Success)
                {
                    var newPasswordHash = _passwordHasher.HashPassword(new User(), newPassword);
                    user.UserPassword = newPasswordHash;
                    _context.Users.Update(user);
                    await _context.SaveChangesAsync();

                    return NoContent();
                }
                else
                {
                    return BadRequest("The old password is incorrect");
                }
            }
            else
            {
                return BadRequest("This user does not exist");
            }
        }

    }
}
